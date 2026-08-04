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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // مراقبة عودة التطبيق للواجهة
    _fetchSavedBookings();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _fetchSavedBookings();
    }
  }

  // دالة لجلب البيانات المخزنة محلياً عند فتح الشاشة
  Future<void> _fetchSavedBookings() async {
    final String? existingBookingsJson =
        await SharedPreferencesHelper.getString('saved_bookings_list');

    if (existingBookingsJson != null && existingBookingsJson.isNotEmpty) {
      List<dynamic> decodedList = jsonDecode(existingBookingsJson);
      if (mounted) {
        setState(() {
          upcomingBookings = decodedList
              .map((item) => Map<String, dynamic>.from(item))
              .toList();
          isLoading = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          upcomingBookings = [];
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchSavedBookings(); // تحديث البيانات عند إعادة بناء الواجهة
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
            color: AppColors.chatMessage2Container,
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
        // --- محتوى التبويبات الثلاثة مع تمرير القائمة المحدثة ---
        Expanded(
          child: TabBarView(
            children: [
              UpcomingTabContent(upcomingBookings: upcomingBookings),
              const CompletedTabContent(),
              const CancelledTabContent(),
            ],
          ),
        ),
      ],
    );
  }
}
