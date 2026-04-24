import Foundation
import SwiftData

/// Tracks whether a local habit record reflects the server state.
/// Stored as a String raw value so SwiftData can persist it directly.
enum SyncStatus: String, Codable {
    /// Local record matches the last known server state.
    case synced
    /// A local change (toggle, create, title edit) hasn't been uploaded yet.
    case pending
    /// The last upload attempt failed; the app will retry on the next sync.
    case failed
    /// Marked for server deletion but the DELETE hasn't been confirmed yet.
    case deleted
}

enum HabitEntryType: String, Codable, CaseIterable, Identifiable {
    case task
    case habit

    var id: String { rawValue }

    var title: String {
        switch self {
        case .task:
            return "Task"
        case .habit:
            return "Habit"
        }
    }

    var systemImage: String {
        switch self {
        case .task:
            return "checklist"
        case .habit:
            return "flame.fill"
        }
    }
}

/// How confidently a habit's completion can be verified against a trusted data source.
/// Drives point multipliers on the leaderboard so self-reported checks can't out-earn
/// checks backed by HealthKit or Screen Time evidence.
enum VerificationTier: String, Codable {
    /// HealthKit / DeviceActivity confirms the activity happened.
    case auto
    /// Some evidence available (hydration log, food diary) but not strictly provable.
    case partial
    /// Honor-system only — no automatic verification possible.
    case selfReport
}

/// Identifies which external signal to consult when verifying a completion.
/// `verificationParam` on the Habit holds the threshold/activity-type for the query
/// (steps count, sleep hours, workout activity type, etc.).
enum VerificationSource: String, Codable {
    case healthKitWorkout          // HKWorkout of a specific activity type
    case healthKitSteps            // HKQuantityTypeIdentifier.stepCount threshold
    case healthKitMindful          // HKCategoryTypeIdentifier.mindfulSession
    case healthKitSleep            // HKCategoryTypeIdentifier.sleepAnalysis
    case healthKitBodyMass         // HKQuantityTypeIdentifier.bodyMass entry today
    case healthKitHydration        // dietaryWater
    case healthKitNoAlcohol        // numberOfAlcoholicBeverages == 0
    case screenTimeSocial          // DeviceActivity social category cap (iOS only)
    case selfReport                // No automatic verification possible
}

@Model
final class Habit {
    var title: String
    @Attribute(originalName: "entryType")
    private var entryTypeRawValue: String?
    var createdAt: Date
    var completedDayKeys: [String]
    var backendId: Int64?
    /// Wall-clock time of the last local modification; used for conflict detection.
    var updatedAt: Date
    /// Outbox state — never `.synced` until the server confirms the write.
    var syncStatus: SyncStatus

    // MARK: - Pending check outbox
    // When the user toggles a habit and the upload hasn't been confirmed yet, these two
    // fields capture the exact operation. `flushOutbox` uses them to send the right
    // done/undone state rather than blindly re-pushing all completedDayKeys.
    // Both are nil when no pending check operation exists.

    /// The day key whose done-state is waiting to be uploaded to the server.
    var pendingCheckDayKey: String?
    /// The done value that should be sent for `pendingCheckDayKey`.
    var pendingCheckIsDone: Bool

    /// Raw value of `HabitReminderWindow`; nil means no time-window reminder.
    var reminderWindow: String?

    /// Optional due date for task-type entries. Nil for habits or undated tasks.
    var dueAt: Date?

    /// When true the habit is hidden from the dashboard and removed from sync.
    /// History is preserved locally so streaks remain intact.
    var isArchived: Bool

    /// True once the overdue penalty (freeze consumption or XP dock) has been
    /// applied for this task. Prevents double-penalising the same overdue task
    /// across sync cycles.
    var overduePenaltyApplied: Bool = false

    // MARK: - Verification (HealthKit / Screen Time)
    // New additive fields — all default, so existing SwiftData stores migrate
    // silently without a migration plan.

    /// Raw `VerificationTier`; defaults to `.selfReport` so legacy habits keep
    /// working unchanged and only earn base points until a canonical mapping
    /// is attached.
    var verificationTierRaw: String = VerificationTier.selfReport.rawValue

    /// Raw `VerificationSource`; nil means "no external signal — honor system".
    var verificationSourceRaw: String? = nil

    /// Threshold or type code for the verification query.
    /// Semantics depend on `verificationSource`:
    ///   - `.healthKitWorkout`: `HKWorkoutActivityType.rawValue` (nil matches any workout)
    ///   - `.healthKitSteps`: step threshold (e.g. 8000)
    ///   - `.healthKitMindful`: minimum minutes (e.g. 5)
    ///   - `.healthKitSleep`: minimum hours (e.g. 7)
    ///   - `.healthKitHydration`: minimum millilitres (e.g. 2000)
    ///   - `.screenTimeSocial`: maximum minutes allowed on social category
    var verificationParam: Double? = nil

    /// Stable id of the `CanonicalHabit` this habit maps to (e.g. `"run"`,
    /// `"workout"`). Nil means the user typed a custom title that didn't
    /// match any canonical alias.
    var canonicalKey: String? = nil

    /// Backward-compatible entry kind accessor.
    /// Older stores may contain missing/invalid values; those fall back to `.habit`.
    var entryType: HabitEntryType {
        get {
            HabitEntryType(rawValue: entryTypeRawValue ?? "") ?? .habit
        }
        set {
            entryTypeRawValue = newValue.rawValue
        }
    }

    /// Typed accessor for `verificationTierRaw`. Unknown raw values fall back
    /// to `.selfReport` so a forward-compatible client never crashes on a
    /// tier introduced later.
    var verificationTier: VerificationTier {
        get { VerificationTier(rawValue: verificationTierRaw) ?? .selfReport }
        set { verificationTierRaw = newValue.rawValue }
    }

    /// Typed accessor for `verificationSourceRaw`.
    var verificationSource: VerificationSource? {
        get { verificationSourceRaw.flatMap(VerificationSource.init(rawValue:)) }
        set { verificationSourceRaw = newValue?.rawValue }
    }

    init(
        title: String,
        entryType: HabitEntryType = .habit,
        createdAt: Date = Date(),
        completedDayKeys: [String] = [],
        backendId: Int64? = nil,
        updatedAt: Date = Date(),
        syncStatus: SyncStatus = .pending,
        pendingCheckDayKey: String? = nil,
        pendingCheckIsDone: Bool = false,
        reminderWindow: String? = nil,
        dueAt: Date? = nil,
        isArchived: Bool = false,
        overduePenaltyApplied: Bool = false,
        verificationTier: VerificationTier = .selfReport,
        verificationSource: VerificationSource? = nil,
        verificationParam: Double? = nil,
        canonicalKey: String? = nil
    ) {
        self.title = title
        self.entryTypeRawValue = entryType.rawValue
        self.createdAt = createdAt
        self.completedDayKeys = completedDayKeys
        self.backendId = backendId
        self.updatedAt = updatedAt
        self.syncStatus = syncStatus
        self.pendingCheckDayKey = pendingCheckDayKey
        self.pendingCheckIsDone = pendingCheckIsDone
        self.reminderWindow = reminderWindow
        self.dueAt = dueAt
        self.isArchived = isArchived
        self.overduePenaltyApplied = overduePenaltyApplied
        self.verificationTierRaw = verificationTier.rawValue
        self.verificationSourceRaw = verificationSource?.rawValue
        self.verificationParam = verificationParam
        self.canonicalKey = canonicalKey
    }

    // MARK: - Convenience

    /// Tasks stay completed once any day key is recorded; habits are per-day.
    var isTaskCompleted: Bool {
        entryType == .task && !completedDayKeys.isEmpty
    }

    /// Task is past its due date (and not yet done). Habits ignore this.
    /// Compared by calendar day: a task due today is not overdue until tomorrow.
    /// Tasks without a due date are never overdue.
    func isOverdue(now: Date = Date()) -> Bool {
        guard entryType == .task, !isTaskCompleted, let due = dueAt else { return false }
        let calendar = Calendar.current
        return calendar.startOfDay(for: due) < calendar.startOfDay(for: now)
    }

    // MARK: - Duplicate detection

    /// Normalized match key: trimmed + lower-cased so "Run ", "run", "RUN"
    /// all collide. Returning an empty string means "no real title to match".
    static func duplicateMatchKey(_ title: String) -> String {
        title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }

    /// True when `candidate` would duplicate an entry of the same kind.
    /// Habits: any active habit with the same title blocks adding (they're
    /// permanent, so a second identical row is never wanted). Tasks: only
    /// blocks while a same-titled task is still pending — once completed the
    /// user can re-add it (e.g. recurring errands like "Pay rent").
    /// Archived entries are ignored so the user can start over on a habit
    /// they previously gave up on.
    static func hasDuplicate(title candidate: String,
                             entryType: HabitEntryType,
                             in habits: [Habit]) -> Bool {
        let key = duplicateMatchKey(candidate)
        guard !key.isEmpty else { return false }
        return habits.contains { existing in
            guard !existing.isArchived,
                  existing.entryType == entryType,
                  duplicateMatchKey(existing.title) == key else { return false }
            switch entryType {
            case .habit: return true
            case .task:  return !existing.isTaskCompleted
            }
        }
    }
}
