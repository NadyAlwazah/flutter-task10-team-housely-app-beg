import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/shared_preferences_helper.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_and_payment/presentation/views/widgets/booking_calender_content.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_and_payment/presentation/views/widgets/booking_property_card.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'booking_period_section.dart';
import 'booking_payment_section.dart';
import 'booking_price_details_section.dart';
import 'success_image_widget.dart';
import 'success_text_widget.dart';

class BookingPaymentViewBody extends StatefulWidget {
  final PropertyModel property;

  const BookingPaymentViewBody({super.key, required this.property});

  @override
  State<BookingPaymentViewBody> createState() => _BookingPaymentViewBodyState();
}

class _BookingPaymentViewBodyState extends State<BookingPaymentViewBody> {
  String? selectedDate;
  String? selectedCard;
  DateTime? _startDate;
  DateTime? _endDate;

  String? savedCardName;
  String? savedCardNumber;
  String? savedCardExpiry;
  String? savedCardCvv;

  Future<void> _saveBookingData({required String status}) async {
    // 1. جلب الحجوزات القديمة
    final String? existingBookingsJson =
        await SharedPreferencesHelper.getString('saved_bookings_list');

    List<Map<String, dynamic>> allBookings = [];

    if (existingBookingsJson != null && existingBookingsJson.isNotEmpty) {
      final List<dynamic> decodedList = jsonDecode(existingBookingsJson);

      allBookings = decodedList
          .map((item) => Map<String, dynamic>.from(item))
          .toList();
    }

    // 2. إنشاء بيانات الحجز الجديد
    final newBooking = {
      'propertyId': widget.property.id,
      'title': widget.property.title,
      'location': widget.property.location,
      'image': widget.property.image,
      'date': selectedDate ?? '',
      'status': status,
    };

    // 3. البحث عن الحجز باستخدام ID العقار
    final int existingIndex = allBookings.indexWhere(
      (item) => item['propertyId'] == newBooking['propertyId'],
    );

    if (existingIndex >= 0) {
      allBookings[existingIndex] = newBooking;
    } else {
      allBookings.add(newBooking);
    }

    // 4. حفظ القائمة
    await SharedPreferencesHelper.saveString(
      'saved_bookings_list',
      jsonEncode(allBookings),
    );

    debugPrint('All Bookings saved successfully as a list!');
  }

  @override
  Widget build(BuildContext context) {
    bool isReadyToPay = selectedDate != null && selectedCard != null;

    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingPropertyCardSection(property: widget.property),
          SizedBox(height: 24.h),

          Text(
            'Period',
            style: Styles.textStyle16W600Inter.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 12.h),
          BookingPeriodSection(
            selectedDate: selectedDate ?? 'Select booking date',
            onTap: () => _showCalendarBottomSheet(context),
          ),
          SizedBox(height: 24.h),
          Text(
            'Payments',
            style: Styles.textStyle16W600Inter.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 12.h),
          BookingPaymentSection(
            selectedCard: selectedCard,
            onAddCardTap: () async {
              // تمرير البيانات القديمة إلى شاشة إضافة البطاقة لكي تظهر عند النقر على Edit
              final result = await context.push(
                AppRouter.kBookingAddCard,
                extra: {
                  'initialName': savedCardName,
                  'initialCardNumber': savedCardNumber,
                  'initialExpiry': savedCardExpiry,
                  'initialCvv': savedCardCvv,
                },
              );

              // استقبال البيانات الكاملة عند الضغط على Add card وحفظها
              if (result != null && result is Map<String, dynamic>) {
                setState(() {
                  savedCardName = result['name'];
                  savedCardNumber = result['cardNumber'];
                  savedCardExpiry = result['expiry'];
                  savedCardCvv = result['cvv'];

                  // تعيين رقم البطاقة لـ selectedCard ليعمل تصميم الـ MasterCard وكلمة Edit في الواجهة الرئيسية
                  selectedCard = savedCardNumber;
                });

                await SharedPreferencesHelper.saveString(
                  'saved_payment_card',
                  selectedCard!,
                );
              }
            },
            onPayPalTap: () async {
              setState(() => selectedCard = "PayPal Connected");
              await SharedPreferencesHelper.saveString(
                'saved_payment_card',
                selectedCard!,
              );
            },
          ),

          const Divider(color: AppColors.lightGrayBackground, thickness: 1),
          SizedBox(height: 16.h),

          GestureDetector(
            onTap: () {},
            child: Text(
              'Enter a Voucher',
              style: Styles.textStyle12W600Inter.copyWith(
                decoration: TextDecoration.underline,
                fontSize: 14.sp,
              ),
            ),
          ),

          SizedBox(height: 28.h),

          Text(
            'Price Details',
            style: Styles.textStyle16W600Inter.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 12.h),
          BookingPriceDetailsSection(
            monthlyPrice:
                double.tryParse(widget.property.pricePerMonth.toString()) ??
                320.0,
            startDate: _startDate,
            endDate: _endDate,
          ),
          SizedBox(height: 32.h),

          if (isReadyToPay) ...[
            CustomButton(
              text: 'Confirm and Pay',
              onPressed: () async {
                await _saveBookingData(status: 'Checkin');
                _showSuccessBottomSheet(context);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ],
      ),
    );
  }

  void _showCalendarBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(top: kToolbarHeight + 40.h),
          child: DraggableScrollableSheet(
            initialChildSize: 0.99,
            minChildSize: 0.8,
            maxChildSize: 0.99,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: BookingCalendarContent(
                  onSave: (dateRange, startDate, endDate) async {
                    setState(() {
                      selectedDate = dateRange;
                      _startDate = startDate;
                      _endDate = endDate;
                    });
                    await SharedPreferencesHelper.saveString(
                      'saved_booking_date',
                      dateRange,
                    );
                    await _saveBookingData(status: 'Waiting payment');
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(top: 250.h),
          child: DraggableScrollableSheet(
            initialChildSize: 1.0,
            minChildSize: 0.8,
            maxChildSize: 1.0,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      SizedBox(height: 48.h),
                      const SuccessImageWidget(),
                      SizedBox(height: 32.h),
                      const SuccessTextWidget(),
                      SizedBox(height: 48.h),
                      CustomButton(
                        text: 'Explore more',
                        onPressed: () {
                          context.go(AppRouter.kBottomBar);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
