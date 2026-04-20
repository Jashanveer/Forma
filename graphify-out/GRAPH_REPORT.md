# Graph Report - .  (2026-04-18)

## Corpus Check
- Corpus is ~27,259 words - fits in a single context window. You may not need a graph.

## Summary
- 543 nodes · 1046 edges · 27 communities detected
- Extraction: 82% EXTRACTED · 18% INFERRED · 0% AMBIGUOUS · INFERRED: 191 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Auth & Calendar UI|Auth & Calendar UI]]
- [[_COMMUNITY_Accountability Social Network|Accountability Social Network]]
- [[_COMMUNITY_Auth Sessions & Calendar Modes|Auth Sessions & Calendar Modes]]
- [[_COMMUNITY_Center Panel & AI Greeting|Center Panel & AI Greeting]]
- [[_COMMUNITY_Backend Auth API Client|Backend Auth API Client]]
- [[_COMMUNITY_Habit Backend Store & Cache|Habit Backend Store & Cache]]
- [[_COMMUNITY_UI Styles & Calendar Grid|UI Styles & Calendar Grid]]
- [[_COMMUNITY_Habit Data Model & Sync|Habit Data Model & Sync]]
- [[_COMMUNITY_JSON Coding Keys|JSON Coding Keys]]
- [[_COMMUNITY_Project Docs & Context|Project Docs & Context]]
- [[_COMMUNITY_Response Cache Layer|Response Cache Layer]]
- [[_COMMUNITY_App Entry & Notifications|App Entry & Notifications]]
- [[_COMMUNITY_UI Test Suite|UI Test Suite]]
- [[_COMMUNITY_Auth Gate Views|Auth Gate Views]]
- [[_COMMUNITY_Retry Policy & Tests|Retry Policy & Tests]]
- [[_COMMUNITY_Looping Video Player|Looping Video Player]]
- [[_COMMUNITY_Time Reminder Manager|Time Reminder Manager]]
- [[_COMMUNITY_Walker Character State|Walker Character State]]
- [[_COMMUNITY_Speech Bubble Nudge|Speech Bubble Nudge]]
- [[_COMMUNITY_Onboarding Flow|Onboarding Flow]]
- [[_COMMUNITY_Edge Panel Handle|Edge Panel Handle]]
- [[_COMMUNITY_Test Naming Guidelines|Test Naming Guidelines]]
- [[_COMMUNITY_Build Commands|Build Commands]]
- [[_COMMUNITY_Coding Style Rules|Coding Style Rules]]
- [[_COMMUNITY_Floating Check Pill|Floating Check Pill]]
- [[_COMMUNITY_Commit & PR Rules|Commit & PR Rules]]
- [[_COMMUNITY_Agent Instructions|Agent Instructions]]

## God Nodes (most connected - your core abstractions)
1. `HabitBackendStore` - 41 edges
2. `CodingKeys` - 26 edges
3. `task` - 22 edges
4. `BackendHabit` - 19 edges
5. `Habit` - 16 edges
6. `HabitMetrics` - 15 edges
7. `BackendAPIClient` - 15 edges
8. `ContentView` - 13 edges
9. `ResponseCache` - 12 edges
10. `HabitRepository` - 12 edges

## Surprising Connections (you probably didn't know these)
- `Project Structure & Module Organization` --semantically_similar_to--> `Architecture Overview`  [INFERRED] [semantically similar]
  AGENTS.md → CLAUDE.md
- `Swift Testing Framework Usage` --semantically_similar_to--> `Testing Guidelines`  [INFERRED] [semantically similar]
  CLAUDE.md → AGENTS.md
- `Code Style Guidelines` --semantically_similar_to--> `Coding Style & Naming Conventions`  [INFERRED] [semantically similar]
  CLAUDE.md → AGENTS.md
- `Build & Test Commands` --semantically_similar_to--> `Build, Test, and Development Commands`  [EXTRACTED] [semantically similar]
  CLAUDE.md → AGENTS.md
- `HabitBackendStore Request States` --conceptually_related_to--> `Habit.swift Data Model`  [INFERRED]
  AGENTS.md → CLAUDE.md

## Hyperedges (group relationships)
- **ContentView Monolithic File - Views, Styles, Logic** — claude_contentview, claude_habitmetrics, claude_datekey, claude_medal_dayinfo, claude_centerpanel, claude_habitcard, claude_statssidebar, claude_calendarsheet, claude_yearperfectcalendar, claude_liquidglass, claude_button_styles [EXTRACTED 1.00]
- **realtime-auth-validator Validation Workflow** — agents_realtime_auth_validator, agents_jwt_refresh, agents_sse_realtime, agents_habitbackendstore, agents_backend_local [EXTRACTED 1.00]
- **Native Mac Design Principles** — claude_design_philosophy, claude_spring_animations, claude_liquidglass, claude_foundationmodels [EXTRACTED 1.00]

## Communities

### Community 0 - "Auth & Calendar UI"
Cohesion: 0.04
Nodes (58): AuthModeButton, AvatarChoice, AvatarChoiceButton, ConnectionStatusPill, FloatingHabitBackground, HabitChipView, HabitItem, CalendarModeToggle (+50 more)

### Community 1 - "Accountability Social Network"
Cohesion: 0.08
Nodes (14): AccountabilityRepository, CheckUpdateRequest, HabitRepository, HabitWriteRequest, MentorshipMessageRequest, StreakFreezeRequest, TaskWriteRequest, ContentView (+6 more)

### Community 2 - "Auth Sessions & Calendar Modes"
Cohesion: 0.07
Nodes (42): BackendAuthTokens, BackendSession, CalendarDisplayMode, activity, perfectDays, CaseIterable, Codable, ConfettiOverlay (+34 more)

### Community 3 - "Center Panel & AI Greeting"
Cohesion: 0.08
Nodes (16): JWTTokenInspector, CenterPanel, HabitMetricsTests, DateKey, DayInfo, HabitMetrics, Medal, SmartGreeting (+8 more)

### Community 4 - "Backend Auth API Client"
Cohesion: 0.07
Nodes (25): ApiErrorResponse, AuthRepository, BackendAPIClient, BackendEnvironment, DeviceRepository, DeviceTokenRequest, EmailVerificationRequest, EmptyResponse (+17 more)

### Community 5 - "Habit Backend Store & Cache"
Cohesion: 0.18
Nodes (1): HabitBackendStore

### Community 6 - "UI Styles & Calendar Grid"
Cohesion: 0.08
Nodes (16): ButtonStyle, MonthDots, CleanShotSurfaceLevel, base, control, elevated, CleanShotSurfaceModifier, EdgeHandleButtonStyle (+8 more)

### Community 7 - "Habit Data Model & Sync"
Cohesion: 0.1
Nodes (7): Habit, HabitModelTests, SSEParsingTests, SyncEngineOutboxTests, SyncEngineReconcileTests, ReconcileResult, SyncEngine

### Community 8 - "JSON Coding Keys"
Cohesion: 0.07
Nodes (30): CodingKeys, accessToken, accessTokenExpiresAtEpochSeconds, refreshToken, token, CodingKey, CodingKeys, badges (+22 more)

### Community 9 - "Project Docs & Context"
Cohesion: 0.08
Nodes (28): Backend Running at http://127.0.0.1:8080, HabitBackendStore Request States, JWT Refresh Pipeline, Project Structure & Module Organization, Integration Test Agent: realtime-auth-validator, SSE Real-Time Chat Events, Architecture Overview, Custom Button Styles (+20 more)

### Community 10 - "Response Cache Layer"
Cohesion: 0.38
Nodes (3): Entry, ResponseCache, ResponseCacheTests

### Community 11 - "App Entry & Notifications"
Cohesion: 0.18
Nodes (7): App, AppDelegate, HabitTrackerMacosApp, Notification.Name, NSApplicationDelegate, NSObject, UNUserNotificationCenterDelegate

### Community 12 - "UI Test Suite"
Cohesion: 0.18
Nodes (3): habit_tracker_macosUITests, habit_tracker_macosUITestsLaunchTests, XCTestCase

### Community 13 - "Auth Gate Views"
Cohesion: 0.24
Nodes (4): AuthGateView, AuthMode, signIn, signUp

### Community 14 - "Retry Policy & Tests"
Cohesion: 0.54
Nodes (2): RetryPolicy, RetryPolicyTests

### Community 15 - "Looping Video Player"
Cohesion: 0.33
Nodes (3): Coordinator, LoopingVideoView, NSViewRepresentable

### Community 16 - "Time Reminder Manager"
Cohesion: 0.43
Nodes (3): ObservableObject, ReminderPlan, TimeReminderManager

### Community 17 - "Walker Character State"
Cohesion: 0.52
Nodes (1): WalkerState

### Community 18 - "Speech Bubble Nudge"
Cohesion: 0.4
Nodes (3): Shape, SpeechBubbleNudge, Triangle

### Community 19 - "Onboarding Flow"
Cohesion: 0.5
Nodes (1): OnboardingView

### Community 20 - "Edge Panel Handle"
Cohesion: 0.4
Nodes (4): DragDirection, horizontal, vertical, EdgePanelHandle

### Community 21 - "Test Naming Guidelines"
Cohesion: 0.67
Nodes (3): Rationale: Test Names After Observable Behavior, Testing Guidelines, Swift Testing Framework Usage

### Community 22 - "Build Commands"
Cohesion: 1.0
Nodes (2): Build, Test, and Development Commands, Build & Test Commands

### Community 23 - "Coding Style Rules"
Cohesion: 1.0
Nodes (2): Coding Style & Naming Conventions, Code Style Guidelines

### Community 24 - "Floating Check Pill"
Cohesion: 1.0
Nodes (0): 

### Community 25 - "Commit & PR Rules"
Cohesion: 1.0
Nodes (1): Commit & Pull Request Guidelines

### Community 26 - "Agent Instructions"
Cohesion: 1.0
Nodes (1): Agent-Specific Instructions

## Knowledge Gaps
- **82 isolated node(s):** `Notification.Name`, `id`, `title`, `reminderWindow`, `checksByDate` (+77 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Build Commands`** (2 nodes): `Build, Test, and Development Commands`, `Build & Test Commands`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Coding Style Rules`** (2 nodes): `Coding Style & Naming Conventions`, `Code Style Guidelines`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Floating Check Pill`** (1 nodes): `FloatingCheckPill.swift`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Commit & PR Rules`** (1 nodes): `Commit & Pull Request Guidelines`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Agent Instructions`** (1 nodes): `Agent-Specific Instructions`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `ContentView` connect `Accountability Social Network` to `Auth & Calendar UI`?**
  _High betweenness centrality (0.142) - this node is a cross-community bridge._
- **Why does `CodingKeys` connect `JSON Coding Keys` to `Auth Sessions & Calendar Modes`, `Center Panel & AI Greeting`?**
  _High betweenness centrality (0.078) - this node is a cross-community bridge._
- **Why does `MonthDots` connect `UI Styles & Calendar Grid` to `Auth & Calendar UI`?**
  _High betweenness centrality (0.076) - this node is a cross-community bridge._
- **Are the 21 inferred relationships involving `task` (e.g. with `.submitMessage()` and `.signOut()`) actually correct?**
  _`task` has 21 INFERRED edges - model-reasoned connections that need verification._
- **What connects `Notification.Name`, `id`, `title` to the rest of the system?**
  _82 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Auth & Calendar UI` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._
- **Should `Accountability Social Network` be split into smaller, more focused modules?**
  _Cohesion score 0.08 - nodes in this community are weakly interconnected._