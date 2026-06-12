import 'package:flutter_test/flutter_test.dart';
import 'package:circle_cricket_live/core/utils/validators.dart';

void main() {
  group('Validators Tests', () {
    test('Email validation - valid email', () {
      final result = Validators.validateEmail('test@example.com');
      expect(result, null);
    });

    test('Email validation - invalid email', () {
      final result = Validators.validateEmail('invalid-email');
      expect(result, isNotNull);
    });

    test('Email validation - empty email', () {
      final result = Validators.validateEmail('');
      expect(result, isNotNull);
    });

    test('Phone number validation - valid', () {
      final result = Validators.validatePhoneNumber('9876543210');
      expect(result, null);
    });

    test('Phone number validation - invalid', () {
      final result = Validators.validatePhoneNumber('123');
      expect(result, isNotNull);
    });

    test('Password validation - valid', () {
      final result = Validators.validatePassword('password123');
      expect(result, null);
    });

    test('Password validation - too short', () {
      final result = Validators.validatePassword('pass');
      expect(result, isNotNull);
    });

    test('Tournament name validation - valid', () {
      final result = Validators.validateTournamentName('Summer League');
      expect(result, null);
    });

    test('Tournament name validation - too short', () {
      final result = Validators.validateTournamentName('ab');
      expect(result, isNotNull);
    });

    test('Non-negative validation - valid', () {
      final result = Validators.validateNonNegative('50');
      expect(result, null);
    });

    test('Non-negative validation - negative', () {
      final result = Validators.validateNonNegative('-10');
      expect(result, isNotNull);
    });
  });
}
