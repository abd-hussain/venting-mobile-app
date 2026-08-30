# Venting Mobile — API Usage Guide

> **Companion to:** [`api-endpoints.md`](./api-endpoints.md) · [`social-auth-backend-requirements.md`](./social-auth-backend-requirements.md)  
> **Purpose:** Describe every REST API and **exactly where in the app** to call it.  
> **Audience:** Mobile engineers wiring screens to the backend.

This guide is organized by **user journey and screen**, not by raw endpoint number. For request/response shapes, see the master spec.

---

## Conventions (read once)

| Rule | Detail |
|------|--------|
| Base URL | `String.fromEnvironment('BASE_URL')` |
| Auth | Public endpoints need no token; everything else sends `Authorization: Bearer {accessToken}` |
| Errors | Match `MainAPIException` (`status: failed` + `error`) |
| Success | Prefer `{ status: "success", data: { … } }` |
| Roles | Call **ventor** APIs only as a ventor; **listener** APIs only as a listener (except shared session join/end/report) |

**When to call `#0 POST /v1/auth/check-email` *(proposed)*:** Email auth step — after user enters email, before password. Branch Create account vs Sign in. Does not authenticate.

**When to call `#7 GET /v1/auth/me`:** Splash / app shell bootstrap — decide route (onboarding vs home) and role before showing tabs. Also after `#1` / `#2` / `#1b` success.

**When to call `#1b POST /v1/auth/social` *(proposed)*:** AuthScreen — after native Google/Apple Sign-In returns an ID token. Optionally after `#0 check-email` when email is available (role mismatch UX). Full backend spec: [`social-auth-backend-requirements.md`](./social-auth-backend-requirements.md).

**When to call `#3 POST /v1/auth/refresh`:** Silently in the Dio interceptor when a Bearer call returns 401 and a refresh token exists — not from a visible screen.

---

## Part A — Shared auth & account

Use these for **both** ventor and listener unless a screen is role-specific.

| # | Endpoint | Where to use it | When to call |
|---|----------|-----------------|--------------|
| 0 *(proposed)* | `POST /v1/auth/check-email` | Email auth step (after AuthScreen → email) | User finishes email; before password — branch register vs login |
| 7 | `GET /v1/auth/me` | Splash · shell bootstrap | App launch / cold start / after `#1` or `#2` to route the user |
| 3 | `POST /v1/auth/refresh` | Dio / auth interceptor (background) | Access token expired; rotate tokens |
| 1 | `POST /v1/auth/register` | Email registration (create account) | Submit email + password + role when `#0` returns `exists: false` (or without `#0`) |
| 2 | `POST /v1/auth/login` | Email sign-in | Submit credentials when `#0` returns `exists: true` |
| 2b *(proposed)* | `POST /v1/auth/forgot-password` | Forgot password confirmation | User confirms email → backend emails secure reset link |
| 2c *(proposed)* | `POST /v1/auth/reset-password` | Reset password **web page** (not mobile) | User sets new password via emailed link |
| 1b *(proposed)* | `POST /v1/auth/social` | AuthScreen (Google / Apple buttons) | After native sign-in; send `provider`, `id_token`, `role`; then `#7` for routing |
| 4 | `POST /v1/auth/logout` | Shared destructive confirm sheet (ventor + listener settings) | User confirms Log out → Bearer `access_token` (+ optional body `refresh_token`); clear session → welcome |
| 5 | `DELETE /v1/auth/account` | Shared destructive confirm sheet (ventor + listener settings) | User confirms Delete account → Bearer `access_token`; clear session → welcome |
| 6 | `POST /v1/auth/change-password` | Shared change password screen (ventor + listener settings) | User submits current + new password; Bearer **`access_token`** only (interceptor). On `401`, show error — do **not** call `#3` refresh |

**`#6` change-password auth:**

1. User is logged in → read `access_token` from secure storage.
2. `POST /v1/auth/change-password` with explicit `Authorization: Bearer {access_token}` header (from `SavedConstants.accessToken`) and body `{ current_password, new_password }`.
3. Never put `refresh_token` on this call — refresh is only for `#3`.
4. `401` = wrong current password (or bad access token) → show API error on screen; interceptor must not retry via refresh.

**Routing hints from `#0` *(proposed)*:**

- `exists == false` → Create account UI → `#1 register`
- `exists == true` → Sign-in UI → `#2 login`
- Welcome `role` ≠ account `role` → show mismatch error; do not register/login
- `registration_complete` / `listener_profile_status` on `#0` are **hints only** — final routing uses `#7` after auth

**Social auth flow (AuthScreen → `#1b`):**

1. User taps Continue with Google or Apple on AuthScreen (ventor or listener path).
2. Native SDK returns `id_token` (+ email on first Apple auth).
3. If email is available → `#0 check-email` with `{ email, role }` — block on role mismatch.
4. `#1b social` with `{ provider, id_token, role, nonce?, full_name? }`.
5. Persist tokens → `#7 me` → same routing as email auth (ventor/listener registration, under_review, home).

**Routing hints from `#7`:**

- `registration_complete == false` → continue role registration
- Listener with `listener_profile_status`: `incomplete` → registration; `under_review` / `rejected` → status screen; `approved` → listener home

---

## Part B — Ventor flows

### B1. First-time ventor setup

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 75 *(proposed)* | `GET /v1/catalog/languages` | Ventor registration → **language step** | On step open — load speaking languages from **`languages`** table (`flag_url`, native + English names). Same catalog as listener languages — no second table. |
| 74 *(proposed)* | `GET /v1/catalog/categories` | Ventor registration → **interests step**; Listener registration → **comfort areas step** | On step open — load categories (`id`, localized name, **`icon_emoji`** + optional `icon_url`). Same list for both roles; **no `audience` query param**. Shimmer while loading. |
| 76 *(proposed)* | `GET /v1/catalog/life-experiences` | Listener registration → **life experiences** step | On step open — load tags from **`life_experiences`**. Show shimmer until loaded. Do **not** hardcode experience chips. |
| 77 *(proposed)* | `GET /v1/catalog/boundaries` | Listener registration → **boundaries** step | On step open — load boundary rows (`icon_emoji` + optional `icon_url`). Shimmer while loading. Selection optional. |
| 74 *(proposed)* | `GET /v1/catalog/categories` | Listener registration → **comfort areas** step | On step open — same categories as ventor interests; shimmer while loading |
| 8a | `GET /v1/ventors/register/progress` | Ventor registration screen open | Resume saved steps + hydrate UI |
| 8b | `PATCH /v1/ventors/register/steps/profile` | Profile step → Continue | Save nickname, gender, avatar/preset |
| 8c | `PATCH /v1/ventors/register/steps/languages` | Language step → Continue | Save `language_ids` |
| 8d | `PATCH /v1/ventors/register/steps/interests` | Interests step → Continue | Save `interest_ids` + optional `other_interest_text` |
| 8e | `POST /v1/ventors/register/complete` | Notifications step | `notifications_enabled` + optional `fcm_token`; sets `registration_complete` |

> **Never call** `GET /v1/catalog` (combined dump). Use `#74` / `#75` / `#76` / `#77` only.

**Ventor onboarding steps:**

1. Profile (nickname / gender / avatar)  
2. `#75` speaking language(s) from `languages` — ≥1 required; flags are CDN URLs managed in the portal  
3. `#74` interest categories from `comfort_areas` — emoji (`icon_emoji`) like language flags; optional CDN `icon_url`  
4. **Enable notifications** (optional) — request OS permission; fetch FCM token when granted  
5. `#8` submit all (creates ventor profile; sets `registration_complete`)

**Languages flow:**

1. Step opens → `#75` load languages (portal-managed `languages` rows).
2. User multi-selects (≥1); search filters client-side for v1.
3. Continue → keep `language_ids` for `#8`.

**Interests flow:**

1. Step opens → `#74` load categories.
2. User selects one or more.
3. If a selected category has `allows_custom_text` (e.g. `other`) → show free-text field; require non-empty trim.
4. Leading icon per row = `icon_url` if set, else `icon_emoji` (same pattern as languages).
5. Continue → notifications step (step 4).

**Notifications flow (ventor + listener):**

1. User taps **Enable Notifications**.
2. App requests OS permission and reads FCM via Firebase (`requestRegistrationNotifications` in `lib/utils/registration_fcm.dart`).
3. **Ventor** complete (`#8e`): always send `notifications_enabled`; add `fcm_token` only when non-empty.
4. **Listener** complete (`#22j`): send optional `fcm_token` only when non-empty.
5. On complete, the app re-resolves the token (`resolveRegistrationFcmToken`) so a token obtained earlier—or still available without permission on some platforms—is submitted when possible.
6. Registration must succeed whether or not a token is sent.

**Example complete payloads:**

Ventor (`POST /v1/ventors/register/complete`):

```json
{ "notifications_enabled": true, "fcm_token": "dK3…" }
```

```json
{ "notifications_enabled": false }
```

Listener (`POST /v1/listeners/register/complete`):

```json
{ "fcm_token": "dK3…" }
```

```json
{}
```

**`#8` “Other” interest contract:**

| Selected | Body |
|----------|------|
| `interest_ids` includes `other` | Must include `other_interest_text` (trimmed, non-empty) |
| No custom-text category | Omit `other_interest_text` |

**`#8e` submit payload (notifications step → complete):**

- `notifications_enabled` (required)
- optional `fcm_token` when available

### B2. Ventor home & wellness

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| **11** | `GET /v1/ventors/me/home` | **Ventor dashboard / home tab** | On tab open / pull-to-refresh — **prefer this single call** for greeting, streak, mood today, upcoming + recent sessions |
| 12 | `POST /v1/ventors/me/mood-checkins` | Mood check-in sheet | User picks a mood (and optional note) and saves |
| 13 | `GET /v1/ventors/me/mood-journey` | Ventor profile — mood journey card | When profile (or that card) is shown; query `days` (default 7) |

### B3. Ventor profile & favorites

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 9 | `GET /v1/ventors/me` | Ventor profile tab | Load profile header, stats, interests |
| 10 | `PATCH /v1/ventors/me` | Edit ventor profile sheet | Save nickname / avatar / quote |
| 14 | `GET /v1/ventors/me/favorites` | Profile — “My listeners” | Load favorite listeners list |
| 15 | `POST /v1/ventors/me/favorites/{listenerId}` | Listener profile / find card heart | User favorites a listener |
| 16 | `DELETE /v1/ventors/me/favorites/{listenerId}` | Same UI (unfavorite) | User removes favorite |

### B4. Ventor settings

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 19 | `GET /v1/ventors/me/notification-preferences` | Ventor notification preferences | Screen open |
| 20 | `PUT /v1/ventors/me/notification-preferences` | Same | User changes reminder / push / email prefs |

### B5. Find listeners & book sessions

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 40 | `GET /v1/listeners` | Ventor sessions tab — **Find** | Search, filter chips, pagination (`q`, topic, price, languages, genders, rating, favorites, online_only) |
| 28 | `GET /v1/listeners/{listenerId}` | Ventor listener profile screen | Open a specific listener’s public card |
| 41 | `POST /v1/sessions/instant-match` | “Surprise me” / instant match | User wants an auto-matched listener |
| 73 | `POST /v1/promo/validate` | Before connecting — checkout | User enters a promo code; validate before pay |
| 42 | `POST /v1/sessions` | Before connecting → pay & book | Confirm booking (instant / nearest / scheduled, voice/video, voice change, promo, reward offer) |

### B6. Ventor sessions list & cancel

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 43 | `GET /v1/ventors/me/sessions` | Booked sessions list (+ home upcoming if not using #11 alone) | Filter by `status`: upcoming / live / completed / cancelled |
| 44 | `GET /v1/ventors/me/sessions/{sessionId}` | Booked session details | Open one session |
| 45 | `POST /v1/ventors/me/sessions/{sessionId}/cancel` | Cancel booked session | User cancels; expect full refund to balance in UI |

### B7. Call, rate, report (ventor)

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 51 | `POST /v1/sessions/{sessionId}/join` | Enter call (ventor side) | Immediately before connecting to VoIP (token + channel) |
| 52 | `POST /v1/sessions/{sessionId}/end` | Leave / hang up | Call ends; optional `ended_by` + `duration_seconds` |
| 53 | `POST /v1/sessions/{sessionId}/rating` | Ventor call rating screen | After call: stars, optional review, tip ($2/$5/$10), optional inline report |
| 55 | `POST /v1/sessions/{sessionId}/reports` | Call report sheet | Standalone report if not sent inside #53 |

### B8. Rewards & invites

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 63 | `GET /v1/ventors/me/rewards` | Rewards tab | Load points, offers, earn rules, welcome gift state |
| 64 | `POST /v1/ventors/me/rewards/redeem` | Rewards tab — redeem CTA | User trades points for an offer |
| 65 | `GET /v1/ventors/me/rewards/trades` | Trade history | Open history list |
| 66 | `GET /v1/ventors/me/invites` | Invite friends / invite history | Load code, link, invitees, points |
| 67 | `POST /v1/ventors/me/invites/refresh-code` | Invite friends (optional) | User regenerates invite code |
| 67a | `GET /v1/ventors/me/rewards/point-packages` | Buy points bottom sheet | On sheet open — load packages + prices from portal |
| 67b | `POST /v1/ventors/me/rewards/purchase-points` | Buy points bottom sheet | User completes purchase; sync balance from `points` in response |

**Pass `reward_offer_id` on `#42`** when booking with an active redeemed offer from #63/#64.

---

## Part C — Listener flows

### C1. Listener registration & verification

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 22a | `GET /v1/listeners/register/progress` | Listener registration screen open | Resume saved steps + hydrate draft |
| 22b–22i | `PATCH /v1/listeners/register/steps/{step}` | Each step → Continue | Save that step only (profile, identity, about, experiences, comfort-areas, boundaries, voice-intro, availability) |
| 22j | `POST /v1/listeners/register/complete` | After notifications step | Optional `fcm_token`; returns `profile_status: under_review` |
| 76 *(proposed)* | `GET /v1/catalog/life-experiences` | Listener registration → life experiences step | On step open — load experience chips; shimmer while loading |
| 23 | `POST /v1/listeners/me/identity-verification` | KYC rejected / resubmit screen | **Only after admin rejects KYC** — resubmit `identity_document` + `selfie` (not front/back). Not used for first-time registration. |

### C2. Listener dashboard & setup

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| **32** | `GET /v1/listeners/me/dashboard` | **Listener dashboard tab** | On open / refresh — aggregate: setup, impact, next session, online flag, reminder |
| 29 | `GET /v1/listeners/me/setup-progress` | Dashboard setup checklist | All 11 steps + `profile_status`, `registration_complete`, `can_go_online`, `steps_to_refill`. Training modules are not sequentially locked in the app during `under_review` |
| 30 | `POST /v1/listeners/me/setup/first-session-tutorial` | First-session tutorial sheet → CTA | Acknowledge tutorial; returns updated setup progress (#29) |
| 71 | `GET /v1/listeners/me/training` | Training bottom sheet open | Load module list + statuses |
| 72 | `POST /v1/listeners/me/training/{moduleId}/complete` | After listener opens a module tutorial | Mark module complete; returns updated training + setup progress when all modules done |
| 31 | `PATCH /v1/listeners/me/online-status` | Dashboard online/available toggle | User goes online/offline |

### C3. Availability

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 37 | `GET /v1/listeners/me/availability` | Availability tab | Load week schedule + instant/session/break settings |
| 38 | `PUT /v1/listeners/me/availability` | Same — save all settings | Persist full object (session length, break, languages, instant, week) |
| 39 | `PUT /v1/listeners/me/availability/days/{day}` | Day schedule bottom sheet | Edit slots for one day (`mon`…`sun`) |

### C4. Listener sessions & requests

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 46 | `GET /v1/listeners/me/sessions` | Listener sessions tab | `filter`: upcoming / missed / history |
| 47 | `GET /v1/listeners/me/session-stats` | Sessions stats card | Load accepted / declined / missed counts |
| 48 | `GET /v1/listeners/me/session-requests` | Pending requests UI | List incoming requests |
| 49 | `POST /v1/listeners/me/session-requests/{requestId}/accept` | Request card — Accept | Instant: first accept wins; handle `already_taken` |
| 50 | `POST /v1/listeners/me/session-requests/{requestId}/decline` | Request card — Decline | Optional reason |

### C5. Call, feedback, report (listener)

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 51 | `POST /v1/sessions/{sessionId}/join` | Enter call (listener) | Same as ventor — get call token |
| 52 | `POST /v1/sessions/{sessionId}/end` | Hang up | Same as ventor |
| 54 | `POST /v1/sessions/{sessionId}/feedback` | Listener call rating | After call: stars + `felt_heard` + `talk_again` |
| 55 | `POST /v1/sessions/{sessionId}/reports` | Listener call report sheet | Report ventor with listener reason codes |

### C6. Listener profile & edits

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 24 | `GET /v1/listeners/me` | Listener profile tab + settings | Load full private profile |
| 25 | `PATCH /v1/listeners/me` | Edit about / city / phone / experiences / comfort / boundaries / country / languages | Save partial edit — **JSON only** (no avatar file) |
| 25b | `POST /v1/listeners/me/avatar` | Listener profile tab — edit photo | Upload new profile photo (`multipart` field `avatar`) |
| 26 | `POST /v1/listeners/me/voice-intro` | Edit voice intro sheet | Upload new m4a/aac intro (`multipart` field `audio`) |
| 27 | `GET /v1/listeners/me/reviews` | Profile reviews bottom sheet | Paginated reviews |

**Media URLs:** `avatar_url` and `voice_intro_url` from #24 are often relative (`/static/uploads/...`). Mobile prefixes with `AppConfig.baseUrl` — see `docs/api-endpoints.md` → [Media URLs](#media-urls-static-uploads).

### C7. Listener privacy & notifications prefs

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 33 | `GET /v1/listeners/me/privacy` | Privacy & visibility | Screen open — load `profile_visible`, online status, country targeting, search indexing |
| 34 | `PUT /v1/listeners/me/privacy` | Same | Save profile visibility, online status, country targeting, search indexing |
| 35 | `GET /v1/listeners/me/notification-preferences` | Listener notification preferences | Screen open |
| 36 | `PUT /v1/listeners/me/notification-preferences` | Same | Save prefs |

### C8. Earnings & payouts

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 56 | `GET /v1/listeners/me/earnings` | Earnings tab summary | Totals, tier, sessions, hours, rating |
| 57 | `GET /v1/listeners/me/earnings/chart` | Earnings chart | Date range `from` / `to` |
| 58 | `GET /v1/listeners/me/payout-balances` | Payment & payouts | Available / pending / lifetime |
| 59 | `GET /v1/listeners/me/payout-methods` | Payment methods list | Load bank / PayPal methods |
| 60 | `PUT /v1/listeners/me/payout-methods` | Add/edit bank (or PayPal) | Save method |
| 61 | `GET /v1/listeners/me/payouts` | Payout history | List past payouts |
| 62 | `POST /v1/listeners/me/payouts` | Request payout | Submit amount + method id |

### C9. Notifications inbox

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 68 | `GET /v1/listeners/me/notifications` | Listener notifications list | Open inbox; optional `unread_only` |
| 69 | `POST /v1/listeners/me/notifications/read-all` | Mark all read action | User clears unread |
| 70 | `DELETE /v1/listeners/me/notifications/{notificationId}` | Swipe/delete one notification | User dismisses one item |
| 70a | `GET /v1/ventors/me/notifications` | Ventor notifications list | Open inbox from dashboard bell |
| 70b | `POST /v1/ventors/me/notifications/read-all` | Ventor mark all read | User clears unread |
| 70c | `DELETE /v1/ventors/me/notifications/{notificationId}` | Ventor swipe/delete | User dismisses one item |

**Welcome / onboarding notifications (server-created):**

| `type` | Typical trigger | Tap action (`data.action`) |
|--------|-----------------|----------------------------|
| `welcome` | Account created | `open_registration` |
| `complete_registration` | Incomplete registration after 24h | `open_registration` + `next_step` |
| `book_first_session` | Registered but no sessions yet | `book_first_session` (ventor) / `open_availability` (listener) |

See **§9 Notifications** in `api-endpoints.md` for full trigger table and payload shape.

### C10. Training

| # | Endpoint | Screen / place | When |
|---|----------|----------------|------|
| 71 | `GET /v1/listeners/me/training` | Training bottom sheet | Load modules + `all_completed` |
| 72 | `POST /v1/listeners/me/training/{moduleId}/complete` | After finishing a module | Mark complete; may unlock setup progress |

Module ids: `art_of_listening`, `empathy`, `boundaries`, `difficult_situations`, `crisis_awareness`.

---

## Part D — Screen → API cheat sheet

### Splash / auth

| Screen | APIs |
|--------|------|
| Splash / bootstrap | `#7` |
| Email auth — email step *(proposed)* | `#0` → branch UI |
| Register | `#0` (optional) → `#1` → `#7` → role register `#8` or `#22` if incomplete |
| Login | `#0` (optional) → `#2` → `#7` |
| Token refresh | `#3` (interceptor) |
| Logout | `#4` |
| Delete account | `#5` |
| Change password | `#6` |

### Ventor tabs

| Screen | Primary APIs |
|--------|----------------|
| Home | `#11` (+ `#12` from mood sheet) |
| Sessions — Find | `#40`, `#41`, `#28`, `#42`, `#73` |
| Sessions — Booked | `#43`, `#44`, `#45` |
| Rewards | `#63`, `#64`, `#65`, `#66`, `#67` |
| Profile | `#9`, `#10`, `#13`, `#14`, `#15`/`#16`, `#17`, `#18`/`#19`, `#20`/`#21`, `#4`, `#5` |
| Call | `#51`, `#52`, `#53`, `#55` |

### Listener tabs

| Screen | Primary APIs |
|--------|----------------|
| Dashboard | `#32`, `#29`, `#30`, `#31`, `#71`/`#72` |
| Sessions | `#46`, `#47`, `#48`, `#49`, `#50` |
| Availability | `#37`, `#38`, `#39` |
| Earnings | `#56`, `#57`, `#58`, `#59`, `#60`, `#61`, `#62` |
| Profile | `#24`, `#25`, `#25b`, `#26`, `#27`, `#33`/`#34`, `#35`/`#36`, `#4`, `#5`, `#6` |
| Notifications | `#68`, `#69`, `#70` |
| Call | `#51`, `#52`, `#54`, `#55` |
| Registration | `#22`, `#23` |

---

## Part E — Recommended call order (happy paths)

### Email auth (with `#0` proposed)

1. Welcome → pick role (`ventor` \| `listener`)
2. AuthScreen → Continue with email
3. `#0` check-email → branch UI (Create account vs Sign in)
4. `#1` register **or** `#2` login (password submit)
5. `#7` auth/me → route (home / role registration / listener status)

### Ventor: cold start → book → call → rate

1. `#7` auth/me  
2. If incomplete → `#8` ventors/register  
3. Home → `#11`  
4. Find → `#40` (or `#41` surprise) → `#28` detail  
5. Checkout → `#73` (if promo) → `#42` book  
6. At call time → `#51` join → (VoIP) → `#52` end → `#53` rate  

### Listener: cold start → go online → accept → call → feedback

1. `#7` auth/me (+ profile status)  
2. If incomplete → `#22` (+ `#23` if needed)  
3. Dashboard → `#32`  
4. Availability → `#37` / `#38` / `#39` as needed  
5. Go online → `#31`  
6. Requests → `#48` → `#49` or `#50`  
7. Join → `#51` → `#52` → `#54`  

### Listener: earn & cash out

1. `#56` + `#57` for summary/chart  
2. `#58` balances → `#59` methods → `#60` if adding method  
3. `#62` request payout → `#61` history  

---

## Part F — Efficiency rules (when *not* to call)

| Prefer | Avoid |
|--------|--------|
| `#11` ventor home | Many separate calls for streak + upcoming + recent on first paint |
| `#32` listener dashboard | Separate setup + impact + next session calls for first paint |
| `#40` with query filters | One endpoint per filter chip |
| `#25` / `#10` PATCH partial (JSON) | Re-uploading the whole profile for one text field |
| `#25b` / `#26` POST multipart | Sending avatar/voice as JSON or via `PATCH /v1/listeners/me` |
| Multipart only for files | JSON-encoding binary avatar/voice/ID data |

Lists that should paginate: listeners (`#40`), sessions (`#43`/`#46`), reviews (`#27`), notifications (`#68`), payouts (`#61`).

Treat accept / decline / redeem / cancel as **idempotent**: safe to retry; handle “already done” (`already_taken`, `409`, etc.).

---

## Part G — Static web content & other non-session URLs

Terms, Privacy, and Help are **static HTML** (6 pages: 3 × EN/AR) under one shared host for both flavors: `https://venting-3a5ebaed4621.herokuapp.com` (`AppConfig.webContentBaseUrl`). See [`static-web/README.md`](./static-web/README.md). No REST call before opening WebView.

| # / URL | Where |
|---------|--------|
| Static `/legal/{en\|ar}/terms.html` · `privacy.html` | Auth, registration, About — locale from app language |
| Static `/help/{en\|ar}/index.html#…` | Help & Support tiles, About guidelines/licenses |
| `mailto:support@venting.app` | Contact support |
| WhatsApp `wa.me` | Support or share |

---

## Quick role matrix

| Domain | Ventor uses | Listener uses |
|--------|:-----------:|:-------------:|
| Auth `#1–7` | ✓ | ✓ |
| Ventor profile/home `#8–21` | ✓ | — |
| Listener profile/onboarding `#22–36` | `#28` only (public card) | ✓ |
| Availability `#37–39` | — | ✓ |
| Discovery & sessions `#40–52` | `#40–45`, `#51–52` | `#46–52` |
| Feedback `#53–55` | `#53`, `#55` | `#54`, `#55` |
| Earnings `#56–62` | — | ✓ |
| Rewards `#63–67` | ✓ | — |
| Notifications `#68–70` | — | ✓ (inbox as specified) |
| Training `#71–72` | — | ✓ |
| Promo `#73` | ✓ | — |
| Catalog `#74–77` | ✓ | ✓ (listener languages / life experiences / comfort / boundaries) |

---

## Endpoint count

**81** unique REST endpoints — full contracts in [`api-endpoints.md`](./api-endpoints.md).

*Usage mapping derived from the proposed screen audit and presentation-layer TODO markers.*
