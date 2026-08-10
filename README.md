# Venting Mobile Application

A safe place to be heard.

Venting is a mobile platform that connects people who need someone to talk to (Venters) with compassionate, verified listeners (Listeners) through secure, private voice conversations.

Project Overview

The goal of this project is to build a modern, premium mobile application that provides a safe environment for meaningful human conversations.

Unlike traditional chat or social media applications, Venting focuses on emotional wellbeing by allowing users to instantly connect with listeners who are available to provide empathy—not therapy.

The mobile application will serve both user types using a single Flutter application. After authentication, the application will determine the user's role and present the appropriate experience.

One Flutter App

        │
        ▼

Authentication

        │
        ▼

───────────────

Venter

or

Listener

───────────────

This approach reduces maintenance effort, keeps the codebase unified, and allows users to switch roles in the future if desired.

Objectives

The primary objectives of the project are:

Build a premium mobile experience
Create a secure and anonymous communication platform
Support both Venters and Listeners in one application
Deliver excellent performance on Android & iOS
Build a scalable architecture for future expansion
Provide an engaging user experience that encourages long-term retention
Target Platforms
Android
iOS

Framework:

Flutter
User Roles
1. Venter

A user seeking someone to talk to.

Main capabilities:

Register/Login
Create profile
Choose listener preferences
Browse listeners
Listen to listener voice introductions
View ratings and reviews
Book a session
Join voice calls
Manage payments
Session history
Rewards & achievements
Notifications
2. Listener

A verified user available to listen.

Main capabilities:

Listener onboarding
Availability management
Receive session requests
Accept/Decline sessions
Voice calls
Earnings dashboard
Session history
Reviews & ratings
Schedule management
Performance statistics
Core Features
Authentication
Apple Sign-In
Google Sign-In
Email Authentication
Anonymous profile
Password recovery
Profile Management
Personal profile
Preferences
Languages
Interests
Privacy settings
Listener Marketplace
Browse listeners
Search
Filters
Ratings
Reviews
Voice introduction
Favourite listeners
Booking
Select listener
Select duration
Topic tags
Payment
Booking confirmation
Voice Session
High-quality voice calls
Mute
Speaker
Report
Session timer
End session
Payments
Payment methods
Booking payments
Wallet (future)
Coupons
Rewards
Notifications
Booking updates
Incoming session requests
Earnings
Promotions
Rewards
Reminders
Rewards
Points
Referral program
Daily streaks
Milestones
Badges
Settings
Account
Privacy
Notifications
Language
Theme
Support
Technical Goals
Clean Architecture
Feature-first project structure
BLoC/Cubit state management
Repository Pattern
Dependency Injection
Responsive UI
Dark theme
Offline support where applicable
High test coverage
CI/CD ready
Milestones
Milestone 1 — Project Foundation
Deliverables
Flutter project setup
Architecture
Design System
Theme
Routing
Localization
Dependency Injection
Networking
Storage
Logging
Analytics foundation
Milestone 2 — Authentication
Deliverables
Splash Screen
Onboarding
Authentication
Profile Creation
Role Selection
Secure Storage
Session Management
Milestone 3 — Venter Experience
Deliverables
Home
Browse Listeners
Listener Details
Search & Filters
Booking Flow
Payments
Voice Session
Session History
Notifications
Profile
Milestone 4 — Listener Experience
Deliverables
Listener Dashboard
Availability
Incoming Requests
Accept / Decline
Voice Session
Earnings
Analytics
Reviews
Profile
Schedule
Milestone 5 — Communication Layer
Deliverables
Voice Calling
Push Notifications
Call States
Reconnection
Background Handling
Permissions
Milestone 6 — Engagement & Retention
Deliverables
Rewards
Daily Streaks
Referral Program
Achievements
Mood Tracking (Optional)
Favourite Listeners
Recommendations
Milestone 7 — Polish & Performance
Deliverables
Animations
Skeleton Loading
Error States
Empty States
Performance Optimisation
Accessibility
App Store Assets
Milestone 8 — Testing
Deliverables
Unit Tests
Widget Tests
Integration Tests
Manual QA
Bug Fixes
Milestone 9 — Production Release
Deliverables
Play Store Release
App Store Release
Production Monitoring
Crash Reporting
Analytics Verification
Documentation
Future Enhancements
AI listener recommendations
Mood tracking
Video sessions
Text sessions
Subscription plans
Wallet
Family accounts
Community groups
Corporate wellness
Wearable integration
Success Metrics
Daily Active Users (DAU)
Monthly Active Users (MAU)
Session Completion Rate
Listener Acceptance Rate
Average Session Rating
User Retention (Day 1 / Day 7 / Day 30)
Booking Conversion Rate
Referral Rate
Crash-Free Sessions (>99.5%)
App Store Rating (Target: ⭐ 4.8+)
Development Principles
Emotion First — Every interaction should help users feel safe, heard, and understood.
Privacy by Design — Protect user identity and conversations at every level.
Performance Matters — Fast, smooth, and responsive experiences on all supported devices.
Accessibility — Build an inclusive app that is easy to use for everyone.
Scalable Architecture — Keep the codebase maintainable and ready for future growth.
Single Codebase — One Flutter application supporting both Venters and Listeners through role-based experiences.

I also recommend adding one final section that many projects miss but investors and engineers appreciate:

🚀 Project Vision

Venting is more than a communication app—it is a platform built to create meaningful human connections through empathy. By combining thoughtful design, secure technology, and a premium user experience, Venting aims to become the most trusted place for people to feel heard, while empowering listeners to make a positive impact and earn from their time.

## Android CI/CD (Google Play alpha draft)

`.github/workflows/deploy.yml` builds a signed App Bundle and uploads it to Google Play **Closed testing (alpha)** as a **draft** via Fastlane (`make deploy-android`).

| Branch | Flavor | Entrypoint | Package name |
| --- | --- | --- | --- |
| `main` | `prod` | `lib/main_prod.dart` | `com.vent.ventingMobileApp` |
| `dev` | `dev` | `lib/main_dev.dart` | `com.vent.ventingMobileApp.dev` |

### Required GitHub secrets

| Secret | Description |
| --- | --- |
| `ANDROID_KEY_PASSWORD` | Keystore **and** key password (same value written to `keyPassword` / `storePassword`) |
| `ANDROID_KEY_ALIAS` | Key alias inside the `.jks` (e.g. `venting`) |
| `ANDROID_KEY_CONTENT` | Base64-encoded Android keystore (`.jks`) |
| `PLAY_STORE_SECRET` | Base64-encoded Google Play Console service-account JSON |

### Encode secrets (macOS / Linux)

```bash
# Keystore → ANDROID_KEY_CONTENT
base64 -i android/keystore/venting.jks | pbcopy   # macOS
# or: base64 -w 0 android/keystore/venting.jks

# Play service account JSON → PLAY_STORE_SECRET
base64 -i path/to/play-service-account.json | pbcopy
# or: base64 -w 0 path/to/play-service-account.json
```

Paste the clipboard / output into the matching GitHub repository secret.

### Local / CI signing layout

- CI writes `android/key.properties` (`keyAlias`, `keyPassword`, `storePassword`) and `android/androidkeystore.jks`.
- Play credentials land at `android/play_store_secret.json` (gitignored).
- Same signing key is used for both flavors; package id differs by flavor (`.dev` suffix).
- AAB paths:
  - prod: `build/app/outputs/bundle/prodRelease/app-prod-release.aab`
  - dev: `build/app/outputs/bundle/devRelease/app-dev-release.aab`

### Manual deploy

```bash
# Production (default)
make deploy-android

# Dev flavor
FLAVOR=dev \
ENTRYPOINT=lib/main_dev.dart \
DART_DEFINE_FILE=.env/config.dev.json \
PACKAGE_NAME=com.vent.ventingMobileApp.dev \
AAB_PATH=build/app/outputs/bundle/devRelease/app-dev-release.aab \
make deploy-android
```

Requires Flutter, Ruby/Bundler, signing files, and Play JSON already in place under `android/`.
