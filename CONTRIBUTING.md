# Circle Cricket Live - Contributing Guidelines

## Code Style

### Dart Formatting
```bash
# Format all Dart files
dart format lib/ test/

# Analyze code
dart analyze
```

### Naming Conventions
- **Classes**: PascalCase (e.g., `LoginScreen`, `ScoringEngine`)
- **Functions**: camelCase (e.g., `calculateNRR`, `processDelivery`)
- **Constants**: camelCase (e.g., `defaultBoundaryRadius`)
- **Private**: Prefix with underscore (e.g., `_calculateOver`)

### File Organization
```
lib/
├── config/          - Configuration files
├── core/            - Core utilities
│   ├── constants/   - App constants
│   ├── errors/      - Error handling
│   ├── network/     - Network utilities
│   └── utils/       - Helper utilities
├── data/            - Data layer
│   ├── models/      - Firestore models
│   └── repositories/- Repository implementations
├── domain/          - Domain layer
│   ├── entities/    - Domain entities
│   └── repositories/- Repository interfaces
├── presentation/    - UI layer
│   ├── providers/   - Riverpod providers
│   ├── router/      - Navigation
│   ├── screens/     - Full screens
│   └── widgets/     - Reusable widgets
└── services/        - Business logic services
```

## Git Workflow

### Branch Naming
- Feature: `feature/description`
- Bug: `bugfix/description`
- Docs: `docs/description`

### Commit Messages
```
feat: Add new feature description
fix: Fix bug description
docs: Update documentation
test: Add unit tests
refactor: Refactor code section
```

### Pull Request Process
1. Create feature branch from `main`
2. Make changes with tests
3. Ensure code passes all checks
4. Submit PR with description
5. Wait for review and approval

## Testing

### Run Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/services/scoring_engine_test.dart

# Generate coverage
flutter test --coverage
```

### Test Coverage
- Aim for >80% coverage
- Test edge cases
- Test error conditions

## Performance Guidelines

- Use `const` constructors
- Cache providers appropriately
- Avoid rebuilds with proper providers
- Use lazy loading for lists
- Implement pagination

## Localization

Add new strings to:
- `lib/l10n/app_en.arb` (English)
- `lib/l10n/app_mr.arb` (Marathi)

Format:
```json
{
  "keyName": "Display text",
  "description": "Description for translators"
}
```

## Bug Reporting

Include:
- Description of issue
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots/videos
- Device info and Flutter version

## Feature Requests

Include:
- Use case description
- Expected behavior
- Mockups or examples
- Impact assessment

## Code Review Checklist

- [ ] Code follows style guide
- [ ] Tests pass
- [ ] Coverage >80%
- [ ] No hardcoded strings (use constants)
- [ ] Error handling implemented
- [ ] Documentation updated
- [ ] No console errors/warnings

## Security Guidelines

- Never commit secrets/credentials
- Use environment variables
- Validate all inputs
- Handle errors gracefully
- Use HTTPS for APIs
- Implement proper authentication

## Questions?

Create an issue or contact the maintainers.
