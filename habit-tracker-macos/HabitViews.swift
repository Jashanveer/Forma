import SwiftUI

struct TodayHeader: View {
    let greeting: String
    var isCompact: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: isCompact ? 4 : 8) {
            Text(greeting)
                .font(.system(size: isCompact ? 22 : 30, weight: .semibold, design: .rounded))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .contentTransition(.numericText())
                .frame(maxWidth: 480)
        }
        .padding(.vertical, isCompact ? 6 : 12)
    }
}

struct AddHabitBar: View {
    @Binding var newHabitTitle: String
    let onAddHabit: () -> Void

    @State private var isHovered = false
    @State private var showValidationError = false
    @FocusState private var fieldFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                TextField("Add a new habit...", text: $newHabitTitle)
                    .textFieldStyle(.plain)
                    .font(.system(size: 14))
                    .padding(.leading, 16)
                    .focused($fieldFocused)
                    .onChange(of: newHabitTitle) { _, _ in showValidationError = false }
                    .onSubmit(attemptAdd)

                if !newHabitTitle.isEmpty {
                    Button(action: attemptAdd) {
                        Text("Add")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 34, height: 34)
                            .background(CleanShotTheme.accent, in: Circle())
                    }
                    .buttonStyle(.plain)
                    .transition(.scale(scale: 0.82, anchor: .trailing).combined(with: .opacity))
                }
            }
            .padding(.trailing, newHabitTitle.isEmpty ? 16 : 5)
            .frame(height: 46)
            .cleanShotSurface(
                shape: Capsule(),
                level: .control,
                isActive: fieldFocused || isHovered
            )
            .animation(.easeOut(duration: 0.15), value: newHabitTitle.isEmpty)
            .animation(.smooth(duration: 0.16), value: fieldFocused)
            .onHover { isHovered = $0 }

            if showValidationError {
                Text("Give your habit a real name — something you'd actually say out loud.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.leading, 16)
                    .transition(.opacity.combined(with: .offset(y: -4)))
            }
        }
        .animation(.easeOut(duration: 0.2), value: showValidationError)
    }

    private func attemptAdd() {
        guard isLikelyMeaningful(newHabitTitle) else {
            withAnimation { showValidationError = true }
            return
        }
        showValidationError = false
        onAddHabit()
    }

    private func isLikelyMeaningful(_ text: String) -> Bool {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let letterChars = trimmed.filter { $0.isLetter }
        guard letterChars.count >= 2 else { return false }

        let lower = letterChars.lowercased()

        // Must have at least one vowel — catches ";klj", "sdfgh", pure consonant mash.
        // 'y' counts so "Gym", "Sky", "Lynx" all pass.
        let vowels = lower.filter { "aeiouy".contains($0) }
        guard !vowels.isEmpty else { return false }

        // Short names with a vowel ("Run", "Gym", "Yoga", "HIIT") are fine
        if lower.count <= 5 { return true }

        // Vowel ratio too low — "sdfjklsd" ≈ 0%
        let ratio = Double(vowels.count) / Double(lower.count)
        if ratio < 0.10 { return false }

        // Repeating half-pattern — "asdfasdf", "sdfsdf"
        let chars = Array(lower)
        let half = chars.count / 2
        if String(chars.prefix(half)) == String(chars.suffix(half)) { return false }

        // All same character
        if Set(lower).count == 1 { return false }

        // 6+ consecutive consonants in a row — not a real word
        let consonants = Set("bcdfghjklmnpqrstvwxz")
        var run = 0
        for ch in lower {
            run = consonants.contains(ch) ? run + 1 : 0
            if run >= 6 { return false }
        }

        return true
    }
}

struct HabitListSection: View {
    let habits: [Habit]
    let todayKey: String
    let onToggle: (Habit) -> Void
    let onDelete: (Habit) -> Void
    var clusters: [AccountabilityDashboard.HabitTimeCluster] = []

    private var doneCount: Int {
        habits.filter { $0.completedDayKeys.contains(todayKey) }.count
    }

    private func cluster(for habit: Habit) -> AccountabilityDashboard.HabitTimeCluster? {
        clusters.first { $0.habitTitle == habit.title }
    }

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack(alignment: .firstTextBaseline) {
                Text("Today's habits")
                    .font(.subheadline.weight(.semibold))
                Spacer()
                Text("\(doneCount)/\(habits.count) done")
                    .font(.caption2.weight(.medium).monospacedDigit())
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: 560)
            .padding(.horizontal, 4)

            LazyVStack(spacing: 6) {
                ForEach(habits) { habit in
                    HabitCard(
                        habit: habit,
                        todayKey: todayKey,
                        onToggle: onToggle,
                        onDelete: onDelete,
                        cluster: cluster(for: habit)
                    )
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct MinimalBackground: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        CleanShotTheme.canvas(for: colorScheme)
            .ignoresSafeArea()
    }
}


struct HabitSidebar: View {
    let habits: [Habit]
    let todayKey: String
    let onToggle: (Habit) -> Void
    let onDelete: (Habit) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .firstTextBaseline) {
                Text("Today's Habits")
                    .font(.title3.bold())
                Spacer()
                Text("\(habits.count) \(habits.count == 1 ? "habit" : "habits")")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
            }

            if habits.isEmpty {
                ContentUnavailableView(
                    "No habits yet",
                    systemImage: "checklist",
                    description: Text("Add a habit in the center panel to start tracking today.")
                )
                .frame(maxHeight: .infinity)
            } else {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(habits) { habit in
                            HabitCard(
                                habit: habit,
                                todayKey: todayKey,
                                onToggle: onToggle,
                                onDelete: onDelete
                            )
                        }
                    }
                    .padding(.bottom, 18)
                }
            }
        }
        .padding(18)
        .sidebarSurfaceStyle()
    }
}

struct HabitCard: View {
    @Environment(\.colorScheme) private var colorScheme

    let habit: Habit
    let todayKey: String
    let onToggle: (Habit) -> Void
    let onDelete: (Habit) -> Void
    var cluster: AccountabilityDashboard.HabitTimeCluster? = nil

    @State private var isHovered = false
    @State private var showArchiveConfirm = false

    private var doneToday: Bool { habit.completedDayKeys.contains(todayKey) }
    private var currentStreak: Int { HabitMetrics.currentStreak(for: habit.completedDayKeys, endingAt: todayKey) }
    private var bestStreak: Int { HabitMetrics.bestStreak(for: habit.completedDayKeys) }
    private var recentDays: [DayInfo] { DateKey.recentDays(count: 7) }

    var body: some View {
        HStack(spacing: 10) {
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    onToggle(habit)
                }
            } label: {
                Image(systemName: doneToday ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 22))
                    .foregroundStyle(doneToday ? CleanShotTheme.success : .secondary.opacity(0.6))
                    .contentTransition(.symbolEffect(.replace.downUp))
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 6) {
                    Text(habit.title)
                        .font(.system(size: 14, weight: .medium))
                        .strikethrough(doneToday)
                        .foregroundStyle(doneToday ? .secondary : .primary)
                        .lineLimit(1)
                    if let cluster, cluster.sampleSize >= 3 {
                        HabitClusterBadge(timeSlot: cluster.timeSlot)
                    }
                }

                HStack(spacing: 8) {
                    if currentStreak > 0 {
                        Label("\(currentStreak)d", systemImage: "flame.fill")
                            .foregroundStyle(CleanShotTheme.warning)
                    }
                    if bestStreak > 0 {
                        Label("\(bestStreak)d best", systemImage: "trophy.fill")
                            .foregroundStyle(CleanShotTheme.gold)
                    }
                    HStack(spacing: 3) {
                        ForEach(recentDays) { day in
                            Circle()
                                .fill(
                                    habit.completedDayKeys.contains(day.key)
                                        ? CleanShotTheme.success
                                        : CleanShotTheme.controlFill(for: colorScheme)
                                )
                                .frame(width: 6, height: 6)
                        }
                    }
                }
                .font(.caption2.weight(.semibold))
            }

            Spacer(minLength: 4)

            SyncStatusBadge(status: habit.syncStatus)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 9)
        .frame(maxWidth: 560, alignment: .leading)
        .cleanShotSurface(
            shape: RoundedRectangle(cornerRadius: 10, style: .continuous),
            level: .control,
            isActive: isHovered
        )
        .scaleEffect(isHovered ? 1.008 : 1)
        .animation(.smooth(duration: 0.15), value: isHovered)
        .onHover { isHovered = $0 }
        .contextMenu {
            Button(role: .destructive) {
                showArchiveConfirm = true
            } label: {
                Label("Archive habit", systemImage: "archivebox")
            }
        }
        .confirmationDialog(
            "Archive \"\(habit.title)\"?",
            isPresented: $showArchiveConfirm,
            titleVisibility: .visible
        ) {
            Button("Archive", role: .destructive) {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    onDelete(habit)
                }
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Your streak history will be preserved. Archived habits can't be restored.")
        }
    }
}

// MARK: - Sync status badge

/// Compact indicator shown on a HabitCard when the local record diverges from the server.
/// Hidden entirely when synced so it consumes no layout space.
private struct SyncStatusBadge: View {
    let status: SyncStatus
    @State private var spinning = false

    var body: some View {
        Group {
            switch status {
            case .synced, .deleted:
                Color.clear.frame(width: 0, height: 0)
            case .pending:
                Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(Color.orange.opacity(0.8))
                    .rotationEffect(.degrees(spinning ? 360 : 0))
                    .animation(.linear(duration: 1.2).repeatForever(autoreverses: false), value: spinning)
                    .onAppear { spinning = true }
            case .failed:
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(Color.red.opacity(0.85))
                    .help("Sync failed — will retry on next sync")
            }
        }
        .transition(.scale.combined(with: .opacity))
        .animation(.smooth(duration: 0.2), value: status)
    }
}

// MARK: - Ambient done-habit stamps

struct DoneHabitPillsBackground: View {
    let habits: [Habit]

    var body: some View {
        GeometryReader { geo in
            TimelineView(.animation(minimumInterval: 1 / 30)) { tl in
                let t = tl.date.timeIntervalSinceReferenceDate
                ZStack {
                    ForEach(habits) { habit in
                        let p = stampParams(for: habit, in: geo.size)
                        let xOff = cos(t * p.speed * 0.55 + p.phase) * p.amp
                        let yOff = sin(t * p.speed + p.phase + 0.8) * p.amp * 0.6
                        let tilt  = p.restAngle + sin(t * p.speed * 0.25 + p.phase) * 2.5
                        AmbientStamp(title: habit.title, accent: p.accent, scale: p.scale)
                            .rotationEffect(.degrees(tilt))
                            .offset(x: xOff, y: yOff)
                            .position(x: p.x, y: p.y)
                    }
                }
            }
        }
        .allowsHitTesting(false)
    }

    private struct StampParams {
        let x, y: CGFloat
        let phase, speed, amp, restAngle: Double
        let accent: Color
        let scale: CGFloat
    }

    private func stampParams(for habit: Habit, in size: CGSize) -> StampParams {
        let s = habit.createdAt.timeIntervalSinceReferenceDate
        let r0 = fract(sin(s * 127.1) * 43758.5)
        let r1 = fract(sin(s * 311.7) * 93714.2)
        let r2 = fract(sin(s * 451.3) * 75291.1)
        let r3 = fract(sin(s * 211.9) * 58173.4)
        let r4 = fract(sin(s * 173.3) * 64821.5)
        let r5 = fract(sin(s * 397.7) * 81234.6)
        let r6 = fract(sin(s * 523.1) * 37492.8)

        // 8 edge zones — stamps stay in the outer ~18% on left/right,
        // or in the narrow top/bottom strips, never in the center panel.
        let zone = Int(r0 * 8)
        let (nx, ny): (Double, Double)
        switch zone {
        case 0: nx = r1 * 0.17 + 0.01; ny = r2 * 0.40 + 0.05
        case 1: nx = r1 * 0.17 + 0.01; ny = r2 * 0.38 + 0.56
        case 2: nx = 0.83 + r1 * 0.16; ny = r2 * 0.40 + 0.05
        case 3: nx = 0.83 + r1 * 0.16; ny = r2 * 0.38 + 0.56
        case 4: nx = r1 * 0.14 + 0.01; ny = r2 * 0.88 + 0.05
        case 5: nx = 0.85 + r1 * 0.14; ny = r2 * 0.88 + 0.05
        case 6: nx = r1 * 0.50 + 0.25; ny = r2 * 0.07 + 0.01
        default: nx = r1 * 0.50 + 0.25; ny = 0.93 + r2 * 0.06
        }

        let palette: [Color] = [
            .green,
            Color(red: 0.18, green: 0.76, blue: 0.60),
            Color(red: 0.55, green: 0.33, blue: 0.98),
            Color(red: 1.0,  green: 0.60, blue: 0.16),
            Color(red: 0.22, green: 0.65, blue: 0.98),
            Color(red: 0.94, green: 0.33, blue: 0.54),
        ]
        let accent = palette[Int(r5 * Double(palette.count)) % palette.count]

        return StampParams(
            x:         CGFloat(nx) * size.width,
            y:         CGFloat(ny) * size.height,
            phase:     r2 * .pi * 2,
            speed:     r3 * 0.13 + 0.07,
            amp:       r4 * 10 + 5,
            restAngle: r5 * 14 - 7,
            accent:    accent,
            scale:     CGFloat(r6 * 0.22 + 0.84)
        )
    }

    private func fract(_ v: Double) -> Double { v - floor(v) }
}

private struct AmbientStamp: View {
    let title: String
    let accent: Color
    let scale: CGFloat

    @State private var visible = false
    @State private var pulse   = false

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .fill(accent.opacity(0.15))
                    .frame(width: 38, height: 38)
                Circle()
                    .strokeBorder(accent.opacity(0.45), lineWidth: 1.5)
                    .frame(width: 38, height: 38)
                Image(systemName: "checkmark")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(accent)
            }
            .scaleEffect(pulse ? 1.07 : 1.0)
            .animation(
                .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                value: pulse
            )

            Text(title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
                .foregroundStyle(.primary.opacity(0.70))
                .lineLimit(1)
                .frame(maxWidth: 80)
        }
        .padding(.horizontal, 13)
        .padding(.vertical, 11)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(accent.opacity(0.07))
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .strokeBorder(
                    LinearGradient(
                        colors: [accent.opacity(0.55), accent.opacity(0.10)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        }
        .shadow(color: .black.opacity(0.06), radius: 3,  x: 0, y: 1)
        .scaleEffect(visible ? scale : 0.3)
        .opacity(visible ? 0.80 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.58)) { visible = true }
            pulse = true
        }
    }
}
