# Circle Cricket Live - Deployment Guide

## Firebase Setup

### 1. Create Firebase Project
- Go to [Firebase Console](https://console.firebase.google.com)
- Create new project
- Enable these services:
  - Authentication (Email, Google, Facebook, Phone)
  - Cloud Firestore
  - Storage
  - Cloud Messaging
  - Analytics

### 2. Android Setup

```bash
# Download google-services.json and place it at:
android/app/google-services.json
```

### 3. iOS Setup

```bash
# Download GoogleService-Info.plist and place it at:
ios/Runner/GoogleService-Info.plist
```

### 4. Firestore Rules

Deploy the rules from `firebase/firestore.rules`:

```bash
firebase deploy --only firestore:rules
```

### 5. Storage Rules

Deploy the rules from `firebase/storage.rules`:

```bash
firebase deploy --only storage
```

## Environment Variables

Create `.env` file:

```
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_APP_ID=your-app-id
FIREBASE_API_KEY=your-api-key
```

## Deployment Checklist

- [ ] Firebase credentials configured
- [ ] Firestore rules deployed
- [ ] Storage rules deployed
- [ ] Authentication providers enabled
- [ ] Cloud Messaging configured
- [ ] App signing configured (Android)
- [ ] Bundle ID verified (iOS)

## CI/CD Pipeline

### GitHub Actions (Optional)

Create `.github/workflows/flutter.yml`:

```yaml
name: Flutter CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      - run: flutter build apk
```

## Version Management

Update version in `pubspec.yaml`:

```yaml
version: 1.0.0+1  # Major.Minor.Patch+BuildNumber
```

## Performance Optimization

1. **Enable Firestore Indexing**
   - Composite indexes created automatically
   - Manual indexes in `firebase/firestore.indexes.json`

2. **Caching Strategy**
   - Firestore persistence enabled
   - Local caching for offline support

3. **Code Splitting**
   - Use dynamic imports for large features
   - Lazy load screens

## Monitoring

### Firebase Console Monitoring

- Real-time database usage
- Authentication metrics
- Crash reporting
- Performance insights

### Analytics Events

Track user actions:
- Tournament creation
- Match scoring
- User authentication
- Feature usage

## Rollback Strategy

Keep previous builds tagged:

```bash
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```

## Support

For deployment issues:
1. Check Firebase documentation
2. Review Firestore rules
3. Verify service credentials
4. Check network connectivity
