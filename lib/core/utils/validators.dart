class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[^@]+@[^@]+\.[^@]+$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Phone number validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[^0-9]'), ''))) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Tournament name validation
  static String? validateTournamentName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tournament name is required';
    }
    if (value.length < 3) {
      return 'Tournament name must be at least 3 characters';
    }
    return null;
  }

  // Non-negative number validation
  static String? validateNonNegative(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (double.tryParse(value) == null || double.parse(value) < 0) {
      return 'Please enter a valid number';
    }
    return null;
  }
}
