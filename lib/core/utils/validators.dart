class Validators {
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    if (value.trim().length < 2) {
      return "Name is too short";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!value.contains("@")) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    final regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*]).{8,}$',
    );

    if (!regex.hasMatch(value)) {
      return message ??
          "Password must contain uppercase, lowercase,\nnumber, and special character";
    }

    return null;
  }

  static String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String newPassword, {
    String? message,
  }) {
    //  تحقق من قوة كلمة المرور
    final baseValidation = validatePassword(value, message: message);
    if (baseValidation != null) {
      return baseValidation;
    }

    //  تحقق من التطابق
    if (value != newPassword) {
      return "Passwords do not match";
    }

    return null;
  }
}
