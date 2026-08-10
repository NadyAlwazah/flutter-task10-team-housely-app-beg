import 'package:flutter/foundation.dart';

/// Singleton بسيط لإشعار أي شاشة مهتمة بأنه صار تغيير على الحجوزات
class BookingRefreshNotifier extends ChangeNotifier {
  BookingRefreshNotifier._internal();
  static final BookingRefreshNotifier instance =
      BookingRefreshNotifier._internal();

  void notifyBookingsChanged() {
    notifyListeners();
  }
}
