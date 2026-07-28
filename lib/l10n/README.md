# Localization

All app-owned strings use ARB files and generated `VentingMobLocalizations`.

## Usage

### UI (with `BuildContext`)

```dart
VentingMobLocalizations.of(context).common_ok
```

### Blocs, repositories, interceptors (no `BuildContext`)

Use the cached holder:

```dart
VentingMobLocalizationsHolder.current.common_unknown_error
```

Language is synced once from preferences at startup, on language change, and when `VentingApp` rebuilds.

## Adding a new string

1. Add the key to all ARB files (`intl_en.arb`, `intl_ar.arb`, `intl_ckb.arb`).
2. Run `flutter gen-l10n`.

## Regenerate

```bash
flutter gen-l10n
```
