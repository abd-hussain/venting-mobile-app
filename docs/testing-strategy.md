# Venting Testing Strategy

> **Purpose:** Describes how testing works in the Venting (`venting_mobile_app`) Flutter app — current practices, layout conventions, and guidance for adding new tests as the product grows.

---

## Table of Contents

1. [Overview](#1-overview)
2. [Test Taxonomy](#2-test-taxonomy)
3. [Project & Tooling](#3-project--tooling)
4. [Test Layout](#4-test-layout)
5. [Unit Tests](#5-unit-tests)
6. [BLoC / Cubit Tests](#6-bloc--cubit-tests)
7. [Widget Tests](#7-widget-tests)
8. [Golden Tests](#8-golden-tests)
9. [Dependency Injection & Mocking](#9-dependency-injection--mocking)
10. [Coverage Policy](#10-coverage-policy)
11. [CI Pipeline](#11-ci-pipeline)
12. [Commands Reference](#12-commands-reference)
13. [Adding Tests](#13-adding-tests)
14. [Reusable AI Prompt Template](#14-reusable-ai-prompt-template)

---

## 1. Overview

Venting is a **single Flutter application** (`venting_mobile_app`) that serves both **Venters** and **Listeners** after role resolution at authentication. The stack targets clean, feature-first architecture with BLoC/Cubit, repositories, and DI.

### Repository structure (target)

```
venting_mobile_app/
lib/
  main.dart / main_dev.dart / main_prod.dart   → Entrypoints + flavors
  app/                                        → App shell, router, bootstrap
  core/                                       → DI, network, theme, utils, l10n, shared widgets
  features/                                   → Feature modules (auth, booking, session, …)
    <feature>/
      domain/                                 → Entities, repositories (interfaces), use cases
      data/                                   → Models, DTOs, repository implementations, API
      presentation/                           → Screens, widgets, blocs/cubits
test/                                         → Mirrors lib/ (and feature folders)
android/, ios/                                → Platform shells with flavors (dev, prod)
.env/                                         → dart-define configs (config.dev.json, config.prod.json)
```

There is no separate `apps/`, `packages/`, or melos workspace of shared packages yet. Shared code lives under `lib/core/`. If packages are extracted later, each package gets its own `test/` directory.

### Core principles

| Principle | Implementation |
|-----------|----------------|
| **Tests live beside the code** | Root `test/` mirrors `lib/` (including `features/<name>/…`) |
| **Headless by default** | All routine tests run via `flutter test` — no device E2E required for PR gates |
| **Deterministic fakes over real I/O** | HTTP, secure storage, permissions, and voice/call bridges are stubbed or faked |
| **Functional error flow** | Repositories and use cases return `TaskEither` / `Either` from `fpdart` |
| **Test BLoCs in isolation** | Prefer `bloc_test` for event → state flows; use widget tests for UI wiring |

### What we do today

- **Placeholder widget smoke test** (`test/widget_test.dart`) against the Flutter counter template in `lib/main.dart`
- **Test stack declared** in `pubspec.yaml`: `flutter_test`, `mocktail`, `bloc_test`
- **Dev tooling present**: `build_runner`, `freezed`, `injectable_generator`, `json_serializable`, `melos`, `dependency_validator`
- **Flavors planned**: VS Code launch configs for `dev` / `prod` with `--dart-define-from-file` (`.env/config.*.json`)

### What we do NOT do (yet)

- No feature-first `lib/` tree or domain/data/presentation layers checked in
- No unit / BLoC / repository test suites beyond the counter smoke test
- No `integration_test` driver tests on simulators/devices
- No golden screenshot tests
- No coverage gates in CI
- No CI pipeline wired for analyze + test (Milestone 1 / 8)

---

## 2. Test Taxonomy

### Current layout

```
test/
└── widget_test.dart    # Counter smoke test (template; replace as app shell lands)
```

### Target layout

```
test/
├── core/
│   ├── network/…                 # API client / error mapping
│   └── utils/…                   # Formatters, validators
├── features/
│   ├── auth/
│   │   ├── domain/usecase/…      # Use cases with fakes
│   │   ├── data/…                # Model parsing, repository
│   │   └── presentation/bloc/…   # bloc_test suites
│   ├── booking/
│   ├── session/                  # Voice session state machines
│   └── …
└── helpers/                      # Shared fakes, pump wrappers, fixtures
```

### Test type definitions

| Type | Runner | Status | What it tests |
|------|--------|--------|---------------|
| **Pure unit** | `test()` via `flutter test` | Planned | JSON parsing, validators, use cases with fakes |
| **BLoC / Cubit** | `blocTest()` via `bloc_test` | Planned | Event → state transitions, side effects |
| **Widget** | `testWidgets()` | Smoke only | UI interactions, BLoC reflected in widget tree |
| **Golden** | `testGoldens()` + `golden` tag | Optional later | Pixel-perfect UI / design-system regression |
| **Device E2E** | `integration_test` | Milestone 8 | Auth, booking, and call flows on simulators |

---

## 3. Project & Tooling

### Package

| Package | Role |
|---------|------|
| `venting_mobile_app` | Single Flutter app (Venters + Listeners) |

### Test runner

| Tool | Role |
|------|------|
| **flutter test** | Primary runner for unit, BLoC, and widget tests |
| **dart test** | Same engine; fine for a single file when invoked directly |

### Key dependencies (testing-relevant)

From root `pubspec.yaml`:

```yaml
dependencies:
  bloc: 9.2.1
  flutter_bloc: 9.1.1
  fpdart: 1.1.1
  freezed_annotation: ^3.1.0
  get_it: 8.0.3
  injectable: 2.5.0
  go_router: 16.2.4
  # …

dev_dependencies:
  flutter_test:
    sdk: flutter
  bloc_test: ^10.0.0
  mocktail: any
  build_runner: ^2.8.0
  freezed: 3.2.3
  injectable_generator: ^2.9.0
  json_serializable: ^6.11.2
  melos: 7.1.1
  dependency_validator: 5.0.5
```

`melos` is available for future multi-package scripts; today the app is a single package — prefer `flutter test` / `flutter analyze` until a workspace is declared.

### Environments & flavors

| Flavor | Config | Entrypoint (planned) |
|--------|--------|----------------------|
| `dev` | `.env/config.dev.json` | `lib/main_dev.dart` |
| `prod` | `.env/config.prod.json` | `lib/main_prod.dart` |

Unit and widget tests should **not** depend on flavor entrypoints or real `BASE_URL` values. Inject fakes / test doubles instead of reading dart-defines in tests.

---

## 4. Test Layout

### Mirror `lib/`

Place test files under `test/` using the same folder structure as `lib/`:

```
lib/features/auth/domain/usecase/login_usecase.dart
  → test/features/auth/domain/usecase/login_usecase_test.dart

lib/features/booking/presentation/bloc/booking_bloc.dart
  → test/features/booking/presentation/bloc/booking_bloc_test.dart

lib/core/network/models/api_error.dart
  → test/core/network/models/api_error_test.dart
```

**Naming:** `{class_or_module}_test.dart`

### Shared test helpers

```
test/helpers/
├── fakes/                 # _Fake* / Fake* implementations reused across suites
├── mocks/                 # mocktail Mock* classes + fallback registration
├── fixtures/              # JSON payloads, entity builders
└── pump_app.dart          # MaterialApp + l10n + theme + optional BlocProvider wrapper
```

Prefer helpers once the same fake appears in 2+ suites. Until then, keep fakes private in the test file.

---

## 5. Unit Tests

Pure unit tests use `package:flutter_test/flutter_test.dart` with **no widget tree** unless the code under test needs `BuildContext` / localizations.

### 5.1 Data layer — JSON / API model parsing

Test `fromJson` / `toJson` with representative payloads and edge cases.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:venting_mobile_app/features/auth/data/models/user_profile_model.dart';

void main() {
  group('UserProfileModel.fromJson', () {
    test('parses venter profile', () {
      final result = UserProfileModel.fromJson({
        'id': 'u_1',
        'role': 'venter',
        'displayName': 'Alex',
      });
      expect(result.id, 'u_1');
      expect(result.role, UserRole.venter);
    });

    test('handles missing optional fields', () {
      final result = UserProfileModel.fromJson({
        'id': 'u_2',
        'role': 'listener',
      });
      expect(result.displayName, isNull);
    });
  });
}
```

**Rules:**
- Use real model classes, not mocks
- Cover happy path, null/missing fields, and malformed edge cases
- Name the file after the class: `{class_name}_test.dart`

### 5.2 Domain layer — use cases with fakes or mocktail

Use cases depend on repositories (and sometimes other use cases). Prefer **fakes** for simple in-memory behavior; use **mocktail** when verifying call order or complex stubs.

```dart
test('returns Right(session) when repository succeeds', () async {
  final repo = _FakeSessionRepository(
    Right(Session(id: 's_1', status: SessionStatus.active)),
  );
  final usecase = StartSessionUsecase(repo);

  final result = await usecase(const StartSessionParams(listenerId: 'l_1')).run();

  expect(result.isRight(), isTrue);
  expect(
    result.getOrElse((_) => throw StateError('expected Right')),
    isA<Session>().having((s) => s.id, 'id', 's_1'),
  );
});
```

**Rules:**
- Construct use cases directly — do not call production `setupDi()` in unit tests
- Assert on `TaskEither` / `Either` with `isRight()`, `isLeft()`, `fold()`, `getOrElse()`
- Track side effects via fake fields (e.g. `callCount`, `lastParams`)
- Cover success, validation failure, repository failure, and role-specific branches (venter vs listener) when relevant

### 5.3 Validators, formatters, and pure logic

```dart
test('rejects empty topic tags', () {
  expect(BookingValidator.topics(const []), isNotNull);
});

test('formats session duration', () {
  expect(formatSessionDuration(const Duration(minutes: 30)), '30 min');
});
```

### 5.4 When to write a unit test vs widget test

| Write unit / BLoC test when… | Write widget test when… |
|------------------------------|-------------------------|
| Logic has no UI dependency | User-visible behavior matters |
| Parsing, validation, mapping | Form validation messages render |
| Use case / repository flow | Navigation, taps, empty/error UI |
| BLoC event → state only | Localization/theme affects rendered output |

---

## 6. BLoC / Cubit Tests

`bloc_test` is a first-class part of this project. Prefer it for presentation-layer state machines.

```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

void main() {
  late MockLoginUsecase loginUsecase;
  late AuthBloc bloc;

  setUp(() {
    loginUsecase = MockLoginUsecase();
    bloc = AuthBloc(loginUsecase: loginUsecase);
  });

  tearDown(() async => bloc.close());

  blocTest<AuthBloc, AuthState>(
    'emits [loading, authenticated] on success',
    build: () {
      when(() => loginUsecase(any())).thenAnswer(
        (_) async => right(const AuthSession(token: 't')),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const AuthEvent.loginSubmitted(
      email: 'a@b.com',
      password: 'secret',
    )),
    expect: () => [
      const AuthState.loading(),
      const AuthState.authenticated(AuthSession(token: 't')),
    ],
    verify: (_) {
      verify(() => loginUsecase(any())).called(1);
    },
  );
}
```

**Rules:**
- Register `registerFallbackValue` in `setUpAll` for custom types used with `any()`
- Test one behavior per `blocTest`
- Prefer asserting freezed state variants over deep UI trees
- Keep async gaps closed with `bloc.close()` in `tearDown`

---

## 7. Widget Tests

Replace the counter smoke test as soon as a real app shell exists. Guidelines:

1. Use `testWidgets()` from `flutter_test`
2. Wrap the widget under test in `MaterialApp` (and later `VentingLocalizations` / theme)
3. Provide BLoCs via `BlocProvider` / `MultiBlocProvider` — do not rely on production GetIt in widget tests
4. Pump and interact with `WidgetTester` (`tap`, `enterText`, `pump`, `pumpAndSettle`)

```dart
testWidgets('shows error when email is empty', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider(
        create: (_) => AuthBloc(loginUsecase: FakeLoginUsecase()),
        child: const LoginScreen(),
      ),
    ),
  );

  await tester.tap(find.byKey(const Key('login_submit')));
  await tester.pump();

  expect(find.text('Email is required'), findsOneWidget);
});
```

For complex screens, extract `test/helpers/pump_app.dart` that wires theme, localization, and router overrides for the scenario.

**Role-aware UI:** Prefer separate widget suites (or clearly named groups) for Venter vs Listener surfaces that share components but diverge in copy or actions.

---

## 8. Golden Tests

Golden screenshot tests are **optional** and not required for Milestone 8. Consider them after the design system stabilizes (theme, typography, shared components).

If adopted:

1. Add `golden_toolkit` or `alchemist` as a dev dependency
2. Add `dart_test.yaml` with a `golden:` tag
3. Store PNGs under `test/goldens/{locale}-{theme}/`
4. Exclude goldens from fast CI with `--exclude-tags golden`
5. Document update commands (`flutter test --update-goldens --tags golden`)

---

## 9. Dependency Injection & Mocking

### Production DI (planned)

- **get_it** + **injectable** under `lib/core/di/`
- Feature modules register repositories, use cases, and BLoCs

### Testing approach

| Layer | Strategy |
|-------|----------|
| **Use cases** | Manual `Fake*` / private `_Fake*` or `mocktail` |
| **Repositories** | Fake in-memory store, or mock interface |
| **HTTP / API** | `mocktail` on client / Dio (or fixture-based fake client) |
| **BLoCs** | Real BLoC + mocked use cases via `bloc_test` |
| **Preferences / secure storage** | In-memory fake implementing the interface |
| **Permissions / voice SDK** | Fake bridges; never call real plugins in unit tests |

App unit and BLoC tests **do not** call `setupDi()` or reset GetIt. Dependencies are constructed in the test.

### mocktail checklist

```dart
class MockAuthRepository extends Mock implements AuthRepository {}

setUpAll(() {
  registerFallbackValue(FakeLoginParams());
});
```

### Future: test DI initializer

If widget or integration-style tests need fuller wiring, add `test/helpers/di_test_initializer.dart` that:

1. Creates / resets GetIt
2. Registers fakes for network, storage, and platform plugins
3. Overrides specific production registrations as needed

Always `tearDown(() async => getIt.reset())` when using GetIt in tests.

---

## 10. Coverage Policy

Coverage is **not enforced** in CI yet. Target high coverage on domain and presentation state (README: high test coverage; Milestone 8).

Collect locally:

```bash
flutter test --coverage
# Report: coverage/lcov.info
```

Recommended exclusions when reporting (generated code):

- `*.g.dart`, `*.freezed.dart`, `*.config.dart`
- `lib/**/gen/` (l10n / flutter_gen)
- Flavor entrypoints that only call `bootstrap()`

Prioritize coverage for:

1. Auth and session management
2. Booking / payment use cases
3. Voice session state (connect, mute, end, reconnect)
4. Role gating (venter vs listener)

---

## 11. CI Pipeline

CI is **not checked in yet**. When added (Azure DevOps, GitHub Actions, or similar), PR validation should at minimum:

1. Checkout
2. Install Flutter **3.41.7** (stable; matches local toolchain / SDK constraint `>=3.11.5 <4.0.0`)
3. `flutter pub get`
4. `dart run dependency_validator` (optional but declared)
5. `flutter analyze`
6. `flutter test`
7. (Later) `flutter test integration_test` on a hosted simulator — Milestone 8

Until CI exists, treat the commands in [§12](#12-commands-reference) as the local gate before opening a PR.

---

## 12. Commands Reference

### Bootstrap

```bash
flutter pub get
```

### Run all tests

```bash
flutter test
```

### Single file / single test

```bash
flutter test test/features/auth/domain/usecase/login_usecase_test.dart

flutter test test/features/auth/presentation/bloc/auth_bloc_test.dart \
  --plain-name 'emits [loading, authenticated] on success'
```

### Code generation (after freezed / injectable / json_serializable changes)

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Quality checks

```bash
dart format --set-exit-if-changed .
flutter analyze
dart run dependency_validator
```

### Localization (when l10n is added)

```bash
flutter gen-l10n
```

---

## 13. Adding Tests

### Checklist

- [ ] Mirror `lib/` path under `test/`
- [ ] Name file `{subject}_test.dart`
- [ ] Prefer `bloc_test` for BLoCs/Cubits; `test()` for use cases/models; `testWidgets()` for UI
- [ ] Use fakes or `mocktail` — no real HTTP, storage, or call SDKs
- [ ] Construct subjects directly (no production GetIt)
- [ ] Cover venter/listener differences when the code is role-aware
- [ ] Run `flutter test path/to/file_test.dart` before opening a PR

### Priority areas for new tests

| Area | Example target | Pattern |
|------|----------------|---------|
| API models | `features/*/data/models/*` | `fromJson` / `toJson` unit tests |
| Use cases | `features/*/domain/usecase/*` | Fakes + `TaskEither` assertions |
| Repositories | `features/*/data/*_repository*` | Fake client + mapping tests |
| BLoCs / Cubits | `features/*/presentation/bloc/*` | `bloc_test` |
| Shared validators | `core/utils/*` | Pure unit tests |
| Screens | `features/*/presentation/*_screen.dart` | `testWidgets` + harness |
| Voice session | session state machine | Unit + BLoC; E2E later |

### Milestone alignment

| Milestone | Testing focus |
|-----------|---------------|
| 1 — Foundation | Helpers, DI fakes, network/error model tests |
| 2 — Authentication | Auth use cases + `AuthBloc` + login/onboarding widget tests |
| 3–4 — Venter / Listener | Feature BLoCs, booking, marketplace, earnings |
| 5 — Communication | Session state, reconnect, permission fakes |
| 8 — Testing | Coverage push, integration tests, manual QA checklist |

---

## 14. Reusable AI Prompt Template

Copy and adapt when asking an AI assistant to add tests in this repo.

---

```
You are adding tests to the Venting Flutter app (package name: venting_mobile_app).

## Product
- One Flutter app for Venters and Listeners (role resolved after auth)
- Privacy- and emotion-first voice conversation platform

## Architecture (target)
- Feature-first: lib/features/<feature>/{domain,data,presentation}
- Shared: lib/core/ (di, network, theme, utils, l10n)
- State: flutter_bloc + freezed
- DI: get_it + injectable
- Errors: fpdart TaskEither / Either in repositories and use cases
- Routing: go_router
- Flavors: dev / prod via --dart-define-from-file (.env/config.*.json)

## Test runner
- flutter test
- Use bloc_test for BLoCs/Cubits
- Use mocktail and/or manual Fake* classes
- No golden tests required unless asked
- No real HTTP, plugins, or voice SDK in unit/widget tests

## Where to put tests
- Mirror lib/: test/features/auth/domain/usecase/login_usecase_test.dart
- Shared helpers: test/helpers/

## Patterns

### API model unit test
- Real fromJson/toJson, happy path + null/missing fields

### Use case unit test
- Fake or mock repositories
- Construct use case directly (no GetIt)
- Assert TaskEither: isRight(), isLeft(), fold(), getOrElse()

### BLoC test
- blocTest with mocked use cases
- registerFallbackValue in setUpAll when using any()
- Assert freezed states; close bloc in tearDown

### Widget test
- pumpWidget with MaterialApp + BlocProvider
- Prefer test/helpers/pump_app.dart when it exists
- Do not use production DI

## Do NOT
- Depend on flavor entrypoints or real BASE_URL in unit tests
- Call production setupDi() in unit/BLoC tests
- Add Co-Authored-By to commits

## Commands
flutter test test/path/to/file_test.dart
flutter test
dart run build_runner build --delete-conflicting-outputs
```

---

## Appendix: Current test inventory

### Root app (`test/`)

| File | What it covers | Status |
|------|----------------|--------|
| `widget_test.dart` | Counter increment smoke test (Flutter template) | Temporary — replace with app-shell / feature tests |

### Not yet present

| Type | Notes |
|------|-------|
| Domain / use case tests | Add with first real use cases |
| BLoC tests (`bloc_test`) | Dependency already in `pubspec.yaml` |
| Repository / API model tests | Add with networking layer |
| Integration tests | Milestone 8 |
| Golden tests | Optional post design-system freeze |

As features land under `lib/features/`, extend this appendix with the corresponding `test/` files.
