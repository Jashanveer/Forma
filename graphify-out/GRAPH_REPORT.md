# Graph Report - /Users/jashanveer/Documents/Forma  (2026-04-27)

## Corpus Check
- 60 files · ~180,956 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 711 nodes · 1210 edges · 46 communities detected
- Extraction: 86% EXTRACTED · 14% INFERRED · 0% AMBIGUOUS · INFERRED: 175 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_Community 8|Community 8]]
- [[_COMMUNITY_Community 9|Community 9]]
- [[_COMMUNITY_Community 10|Community 10]]
- [[_COMMUNITY_Community 11|Community 11]]
- [[_COMMUNITY_Community 12|Community 12]]
- [[_COMMUNITY_Community 13|Community 13]]
- [[_COMMUNITY_Community 14|Community 14]]
- [[_COMMUNITY_Community 15|Community 15]]
- [[_COMMUNITY_Community 16|Community 16]]
- [[_COMMUNITY_Community 17|Community 17]]
- [[_COMMUNITY_Community 18|Community 18]]
- [[_COMMUNITY_Community 19|Community 19]]
- [[_COMMUNITY_Community 20|Community 20]]
- [[_COMMUNITY_Community 21|Community 21]]
- [[_COMMUNITY_Community 22|Community 22]]
- [[_COMMUNITY_Community 23|Community 23]]
- [[_COMMUNITY_Community 24|Community 24]]
- [[_COMMUNITY_Community 25|Community 25]]
- [[_COMMUNITY_Community 26|Community 26]]
- [[_COMMUNITY_Community 27|Community 27]]
- [[_COMMUNITY_Community 28|Community 28]]
- [[_COMMUNITY_Community 29|Community 29]]
- [[_COMMUNITY_Community 30|Community 30]]
- [[_COMMUNITY_Community 31|Community 31]]
- [[_COMMUNITY_Community 32|Community 32]]
- [[_COMMUNITY_Community 33|Community 33]]
- [[_COMMUNITY_Community 34|Community 34]]
- [[_COMMUNITY_Community 35|Community 35]]
- [[_COMMUNITY_Community 36|Community 36]]
- [[_COMMUNITY_Community 37|Community 37]]
- [[_COMMUNITY_Community 38|Community 38]]
- [[_COMMUNITY_Community 39|Community 39]]
- [[_COMMUNITY_Community 40|Community 40]]
- [[_COMMUNITY_Community 41|Community 41]]
- [[_COMMUNITY_Community 42|Community 42]]
- [[_COMMUNITY_Community 43|Community 43]]
- [[_COMMUNITY_Community 44|Community 44]]
- [[_COMMUNITY_Community 45|Community 45]]

## God Nodes (most connected - your core abstractions)
1. `HabitBackendStore` - 60 edges
2. `CodingKeys` - 48 edges
3. `BackendHabit` - 21 edges
4. `BackendAPIClient` - 21 edges
5. `Habit (SwiftData @Model)` - 19 edges
6. `CodingKeys` - 18 edges
7. `Forma iOS Design Brief` - 17 edges
8. `AccountabilityRepository` - 13 edges
9. `ResponseCache` - 12 edges
10. `HabitRepository` - 12 edges

## Surprising Connections (you probably didn't know these)
- `SyncEngine` --conceptually_related_to--> `Integration Test Agent realtime-auth-validator`  [INFERRED]
  Forma/SyncEngine.swift → AGENTS.md
- `Liquid Glass Surfaces` --aligns_with--> `Native Apple Squircle Icon Design`  [INFERRED]
  FORMA_iOS_DESIGN_BRIEF.md → Forma/Assets.xcassets/AppIcon.appiconset/icon_1024.png
- `Forma iOS Design Brief` --semantically_similar_to--> `CLAUDE.md (Project Guide)`  [INFERRED] [semantically similar]
  FORMA_iOS_DESIGN_BRIEF.md → CLAUDE.md
- `Liquid Glass Surfaces` --semantically_similar_to--> `Key Patterns (Liquid Glass + Streaks)`  [INFERRED] [semantically similar]
  FORMA_iOS_DESIGN_BRIEF.md → CLAUDE.md
- `Spring Motion Only` --semantically_similar_to--> `Design Philosophy (Native-Feel)`  [INFERRED] [semantically similar]
  FORMA_iOS_DESIGN_BRIEF.md → CLAUDE.md

## Hyperedges (group relationships)
- **Native-Feel Design Principles** — forma_ios_design_brief_liquid_glass, forma_ios_design_brief_spring_motion, forma_ios_design_brief_system_respectful, forma_ios_design_brief_rationale_native_feel, claude_md_design_philosophy [INFERRED 0.85]
- **Verification Tier System (auto/partial/self)** — claude_md_verification_tiers, claude_md_verification_sources, claude_md_canonical_key, verificationservice_verificationservice, canonicalhabits_canonicalhabits, habitcompletion_habitcompletion, habit_habit [EXTRACTED 1.00]
- **Toggle to Verify to Leaderboard Flow** — contentview_contentview, habitbackend_habitbackendstore, verificationservice_verificationservice, habitcompletion_habitcompletion, claude_md_phase2_backend, claude_md_leaderboard_followups [EXTRACTED 1.00]

## Communities

### Community 0 - "Community 0"
Cohesion: 0.04
Nodes (38): AccountabilityRepository, ApiErrorResponse, AppleLoginRequest, AuthRepository, BackendAPIClient, BackendEnvironment, BackendSession, CheckUpdateRequest (+30 more)

### Community 1 - "Community 1"
Cohesion: 0.04
Nodes (53): ChatMessageRow, ChecklistRow, ChecklistView, ChecklistWidget, BadgeStat, CCChecklistRow, ChallengeCard, CommandCenterView (+45 more)

### Community 2 - "Community 2"
Cohesion: 0.11
Nodes (1): HabitBackendStore

### Community 3 - "Community 3"
Cohesion: 0.04
Nodes (54): Build, Test, and Development Commands, Coding Style & Naming Conventions, AGENTS.md Repository Guidelines, JWT Refresh Pipeline, Validation Pass Criteria, Project Structure & Module Organization, Integration Test Agent realtime-auth-validator, HabitBackendStore Request States (+46 more)

### Community 4 - "Community 4"
Cohesion: 0.04
Nodes (45): CodingKeys, aiMentor, badges, canonicalKey, checksByDate, checksToday, createdAt, currentUser (+37 more)

### Community 5 - "Community 5"
Cohesion: 0.08
Nodes (21): AppIntent, UserPreferences, Codable, Equatable, SnapshotEntry, SnapshotTimelineProvider, TimelineEntry, TimelineProvider (+13 more)

### Community 6 - "Community 6"
Cohesion: 0.08
Nodes (8): HabitMigrationTests, VerificationServiceFallbackTests, WeeklyTargetTests, HabitMetricsTests, HabitModelTests, SyncEngineOutboxTests, SyncEngineReconcileTests, Habit (SwiftData @Model)

### Community 7 - "Community 7"
Cohesion: 0.08
Nodes (12): CaseIterable, FormaUITests, FormaUITestsLaunchTests, OverduePenaltyStore, HabitReminderWindow, afternoon, evening, morning (+4 more)

### Community 8 - "Community 8"
Cohesion: 0.07
Nodes (26): CodingKeys, accessToken, accessTokenExpiresAtEpochSeconds, isNewUser, refreshToken, token, JWTTokenInspector, CodingKey (+18 more)

### Community 9 - "Community 9"
Cohesion: 0.13
Nodes (23): BackendAuthTokens, Decodable, AccountabilityDashboard, EmptyResponse, FriendSummary, HabitTimeCluster, LeaderboardEntry, Level (+15 more)

### Community 10 - "Community 10"
Cohesion: 0.09
Nodes (16): ButtonStyle, CleanShotSurfaceLevel, base, control, elevated, CleanShotSurfaceModifier, EdgeHandleButtonStyle, MinimalToggleStyle (+8 more)

### Community 11 - "Community 11"
Cohesion: 0.15
Nodes (7): Entry, HabitRepository, HabitWriteRequest, ResponseCache, TaskWriteRequest, ResponseCacheTests, BackendHabit

### Community 12 - "Community 12"
Cohesion: 0.16
Nodes (6): RetryPolicy, CheckStroke, Color, FormaIconView, RetryPolicyTests, Shape

### Community 13 - "Community 13"
Cohesion: 0.18
Nodes (3): AutoVerificationCoordinator, HabitCompletion, KeychainSessionStore

### Community 14 - "Community 14"
Cohesion: 0.11
Nodes (17): canonicalKey Field, Tier-weighted Leaderboard (auto×10/partial×5/self×1), Perfect-Day Math (frequency rest budget), Backend Round-Trip Phase 2, Rationale: additive defaults so SwiftData lightweight-migrates, Rationale: never auto-applied silently, Rationale: distinguish auto-confirmed from honor-system, Rationale: frequency habits hide once weekly target met (+9 more)

### Community 15 - "Community 15"
Cohesion: 0.13
Nodes (10): AppleProfileSetupView, AvailabilityState, available, checking, invalid, taken, untouched, Field (+2 more)

### Community 16 - "Community 16"
Cohesion: 0.23
Nodes (3): MenteeCharacterView, MentorCharacterView, Ranked

### Community 17 - "Community 17"
Cohesion: 0.24
Nodes (3): NetworkMonitor, ObservableObject, WalkerState

### Community 18 - "Community 18"
Cohesion: 0.25
Nodes (3): Layout, FlowLayout, VerificationHelpSheet

### Community 19 - "Community 19"
Cohesion: 0.31
Nodes (2): CanonicalHabitsTests, match

### Community 20 - "Community 20"
Cohesion: 0.38
Nodes (1): FormaTransition

### Community 21 - "Community 21"
Cohesion: 0.67
Nodes (2): FormaWidgetsBundle, WidgetBundle

### Community 22 - "Community 22"
Cohesion: 1.0
Nodes (2): AuthViews, Auth Screen

### Community 23 - "Community 23"
Cohesion: 1.0
Nodes (2): FloatingCheckPill, Floating Elements

### Community 24 - "Community 24"
Cohesion: 1.0
Nodes (1): ConfettiOverlay

### Community 25 - "Community 25"
Cohesion: 1.0
Nodes (1): SettingsPanel

### Community 26 - "Community 26"
Cohesion: 1.0
Nodes (1): SpeechBubbleNudge

### Community 27 - "Community 27"
Cohesion: 1.0
Nodes (1): StatsSidebar

### Community 28 - "Community 28"
Cohesion: 1.0
Nodes (1): CanonicalHabits

### Community 29 - "Community 29"
Cohesion: 1.0
Nodes (1): LoopingVideoView

### Community 30 - "Community 30"
Cohesion: 1.0
Nodes (1): CenterPanel

### Community 31 - "Community 31"
Cohesion: 1.0
Nodes (1): HabitMetrics

### Community 32 - "Community 32"
Cohesion: 1.0
Nodes (1): HabitCard

### Community 33 - "Community 33"
Cohesion: 1.0
Nodes (1): CleanShotTheme

### Community 34 - "Community 34"
Cohesion: 1.0
Nodes (1): OnboardingView

### Community 35 - "Community 35"
Cohesion: 1.0
Nodes (1): ContentView

### Community 36 - "Community 36"
Cohesion: 1.0
Nodes (1): VerificationService

### Community 37 - "Community 37"
Cohesion: 1.0
Nodes (1): FormaIntroView

### Community 38 - "Community 38"
Cohesion: 1.0
Nodes (1): CalendarSheet

### Community 39 - "Community 39"
Cohesion: 1.0
Nodes (1): YearPerfectCalendar

### Community 40 - "Community 40"
Cohesion: 1.0
Nodes (1): Intro / Cold-Launch Screen

### Community 41 - "Community 41"
Cohesion: 1.0
Nodes (1): Onboarding Flow

### Community 42 - "Community 42"
Cohesion: 1.0
Nodes (1): Stats / Progress Screen

### Community 43 - "Community 43"
Cohesion: 1.0
Nodes (1): Social / Settings Screen

### Community 44 - "Community 44"
Cohesion: 1.0
Nodes (1): Calendar Screen

### Community 45 - "Community 45"
Cohesion: 1.0
Nodes (1): Habit Card Design

## Knowledge Gaps
- **149 isolated node(s):** `ConfettiOverlay`, `TopFriendSnapshot`, `id`, `title`, `reminderWindow` (+144 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Community 22`** (2 nodes): `AuthViews`, `Auth Screen`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 23`** (2 nodes): `FloatingCheckPill`, `Floating Elements`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 24`** (1 nodes): `ConfettiOverlay`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 25`** (1 nodes): `SettingsPanel`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 26`** (1 nodes): `SpeechBubbleNudge`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 27`** (1 nodes): `StatsSidebar`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 28`** (1 nodes): `CanonicalHabits`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 29`** (1 nodes): `LoopingVideoView`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 30`** (1 nodes): `CenterPanel`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 31`** (1 nodes): `HabitMetrics`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 32`** (1 nodes): `HabitCard`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 33`** (1 nodes): `CleanShotTheme`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 34`** (1 nodes): `OnboardingView`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 35`** (1 nodes): `ContentView`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 36`** (1 nodes): `VerificationService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 37`** (1 nodes): `FormaIntroView`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 38`** (1 nodes): `CalendarSheet`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 39`** (1 nodes): `YearPerfectCalendar`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 40`** (1 nodes): `Intro / Cold-Launch Screen`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 41`** (1 nodes): `Onboarding Flow`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 42`** (1 nodes): `Stats / Progress Screen`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 43`** (1 nodes): `Social / Settings Screen`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 44`** (1 nodes): `Calendar Screen`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 45`** (1 nodes): `Habit Card Design`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `HabitBackendStore` connect `Community 2` to `Community 0`, `Community 8`, `Community 9`, `Community 13`, `Community 17`?**
  _High betweenness centrality (0.141) - this node is a cross-community bridge._
- **Why does `CodingKeys` connect `Community 4` to `Community 8`, `Community 9`, `Community 19`?**
  _High betweenness centrality (0.133) - this node is a cross-community bridge._
- **Are the 16 inferred relationships involving `BackendHabit` (e.g. with `.listHabits()` and `.listTasks()`) actually correct?**
  _`BackendHabit` has 16 INFERRED edges - model-reasoned connections that need verification._
- **What connects `ConfettiOverlay`, `TopFriendSnapshot`, `id` to the rest of the system?**
  _149 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Community 0` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._
- **Should `Community 1` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._
- **Should `Community 2` be split into smaller, more focused modules?**
  _Cohesion score 0.11 - nodes in this community are weakly interconnected._