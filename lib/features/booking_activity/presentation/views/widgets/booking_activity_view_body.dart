import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/shared_preferences_helper.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'upcoming_tab_content.dart';
import 'completed_tab_content.dart';
import 'cancelled_tab_content.dart';

class BookingActivityViewBody extends StatefulWidget {
  const BookingActivityViewBody({super.key});

  @override
  State<BookingActivityViewBody> createState() =>
      _BookingActivityViewBodyState();
}

class _BookingActivityViewBodyState extends State<BookingActivityViewBody>
    with WidgetsBindingObserver {
  List<Map<String, dynamic>> upcomingBookings = [];
  List<Map<String, dynamic>> cancelledBookings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _fetchAllBookings();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _fetchAllBookings();
    }
  }

  // دالة لجلب البيانات المخزنة محلياً عند فتح الشاشة
  Future<void> _fetchAllBookings() async {
    final String? upcomingJson = await SharedPreferencesHelper.getString(
      'saved_bookings_list',
    );
    final String? cancelledJson = await SharedPreferencesHelper.getString(
      'saved_cancelled_bookings_list',
    );

    if (mounted) {
      setState(() {
        if (upcomingJson != null && upcomingJson.isNotEmpty) {
          upcomingBookings = List<Map<String, dynamic>>.from(
            jsonDecode(
              upcomingJson,
            ).map((item) => Map<String, dynamic>.from(item)),
          );
        } else {
          upcomingBookings = [];
        }

        if (cancelledJson != null && cancelledJson.isNotEmpty) {
          cancelledBookings = List<Map<String, dynamic>>.from(
            jsonDecode(
              cancelledJson,
            ).map((item) => Map<String, dynamic>.from(item)),
          );
        } else {
          cancelledBookings = [];
        }

        isLoading = false;
      });
    }
  }

  // دالة لحذف العنصر ونقله إلى الـ Cancelled
  Future<void> _deleteBooking(int index) async {
    final booking = upcomingBookings[index];

    // التحقق من أن الحالة هي Checkin (مع تجاهل حالة الأحرف الكبيرة والصغيرة)
    final String status = (booking['status'] ?? '')
        .toString()
        .trim()
        .toLowerCase();

    if (status == 'waiting payment') {
      setState(() {
        // 1. إزالته من القائمة القادمة
        upcomingBookings.removeAt(index);

        // 2. تحديث حالته إلى Cancelled وإضافته للقائمة الملغاة
        booking['status'] = 'Cancelled';
        cancelledBookings.add(booking);
      });

      // 3. حفظ القائمتين في SharedPreferences بشكل دائم
      await SharedPreferencesHelper.saveString(
        'saved_bookings_list',
        jsonEncode(upcomingBookings),
      );
      await SharedPreferencesHelper.saveString(
        'saved_cancelled_bookings_list',
        jsonEncode(cancelledBookings),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Only waiting payment bookings can be cancelled'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchAllBookings();
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        SizedBox(height: 16.h),
        // --- تصميم الـ TabBar ---
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          height: 52.h,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: AppColors.lightGrayBackground,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 2.h,
            ),
            indicator: BoxDecoration(
              color: AppColors.primary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(5.r),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: AppColors.textUnselected.withOpacity(0.5),
            labelStyle: Styles.textStyle14W500Inter,
            unselectedLabelStyle: Styles.textStyle14W400Inter,
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        // --- محتوى التبويبات الثلاثة ---
        Expanded(
          child: TabBarView(
            children: [
              UpcomingTabContent(
                upcomingBookings: upcomingBookings,
                onDeleteBooking: _deleteBooking,
              ),
              const CompletedTabContent(),
              CancelledTabContent(cancelledBookings: cancelledBookings),
            ],
          ),
        ),
      ],
    );
  }
}
