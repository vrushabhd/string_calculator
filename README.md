# String Calculator (Flutter)

This is a small Flutter project implementing the Incubyte String Calculator TDD Kata.

Files added:
- `lib/string_calculator.dart` - implementation and NegativeNumbersException
- `lib/main.dart` - minimal Flutter UI to try the calculator
- `test/string_calculator_test.dart` - unit tests covering kata requirements

How to run locally

1. Install Flutter SDK: https://flutter.dev/docs/get-started/install
2. From the project root run:

```powershell
flutter pub get
flutter test
```

To run the app on an emulator or device:

```powershell
flutter run
```

Notes
- The implementation supports custom single-character delimiters and multi-character delimiters wrapped in [ ]. It will throw a `NegativeNumbersException` showing all negative numbers.

CI
- A GitHub Actions workflow is included at `.github/workflows/flutter.yml` which runs `flutter test` on pushes and PRs to `main`/`master`.

Extra rules implemented
- Ignore numbers greater than 1000 (common kata extension).

