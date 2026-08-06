class EmailMasker {
  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final name = parts[0];
    final domain = parts[1];
    // إذا الاسم قصير جدا
    if (name.length <= 2) {
      return '${name[0]}***@$domain';
    }
    // إخفاء كل شيء بعد أول حرفين
    final maskedName = '${name.substring(0, 2)}***';
    return '$maskedName@$domain';
  }
}
