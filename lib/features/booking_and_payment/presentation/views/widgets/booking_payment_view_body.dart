import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/shared_preferences_helper.dart';
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
  String? selectedDate; // يبدأ فارغاً
  String? selectedCard; // يبدأ فارغاً
  DateTime? _startDate;
  DateTime? _endDate;
  @override
 /* void initState() {
    super.initState();
    _loadSavedData(); //  استرجاع البيانات المحفوظة بمجرد فتح الشاشة
  }*/

  // دالة لجلب البيانات المحفوظة محلياً عبر SharedPreferencesHelper
 /* Future<void> _loadSavedData() async {
    String? loadedDate = await SharedPreferencesHelper.getString(
      'saved_booking_date',
    );
    String? loadedCard = await SharedPreferencesHelper.getString(
      'saved_payment_card',
    );

    setState(() {
      if (loadedDate != null) selectedDate = loadedDate;
      if (loadedCard != null) selectedCard = loadedCard;
    });
  }*/

  Future<void> _saveBookingData() async {
    if (selectedDate != null) {
      await SharedPreferencesHelper.saveString(
        'saved_booking_date',
        selectedDate!,
      );
    }
    if (selectedCard != null) {
      await SharedPreferencesHelper.saveString(
        'saved_payment_card',
        selectedCard!,
      );
    }
    await SharedPreferencesHelper.saveString(
      'saved_property_title',
      widget.property.title.toString(),
    );

    debugPrint("Booking and Card saved locally successfully!");
  }

  @override
  Widget build(BuildContext context) {
    // الشرط لإظهار الزر: يجب أن يتم اختيار التاريخ وتحديد وسيلة دفع
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
              final result = await context.push('/booking_add_card');
              if (result != null && result is String) {
                setState(
                  () => selectedCard =
                      'Card ending in ${result.substring(result.length - 4)}',
                );
                await SharedPreferencesHelper.saveString(
                  'saved_payment_card',
                  selectedCard!,
                );
              }
            },
            onPayPalTap: () async {
              setState(() => selectedCard = "PayPal Connected");
              // حفظ وسيلة الدفع فور اختيارها
              await SharedPreferencesHelper.saveString(
                'saved_payment_card',
                selectedCard!,
              );
            },
          ),

          const Divider(color: Color(0xFFE5E7EB), thickness: 1),
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
                double.tryParse(widget.property.price.toString()) ?? 320.0,
            startDate: _startDate,
            endDate: _endDate,
          ),
          SizedBox(height: 32.h),

          //  زر Confirm and Pay يظهر فقط إذا اكتمل اختيار التاريخ والبطاقة
          if (isReadyToPay) ...[
            CustomButton(
              text: 'Confirm and Pay',
              onPressed: () async {
                // 1. حفظ البيانات محلياً عبر SharedPreferencesHelper
                await _saveBookingData();

                // 2. إظهار نافذة النجاح
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
      backgroundColor: Colors
          .transparent, // خلفية شفافة لكي يعمل الـ DraggableScrollableSheet
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 250.h,
          ), // لتغطية الواجهة مع إبقاء الـ AppBar ظاهراً
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
                          Navigator.pop(context);
                          context.go('/bottom_bar');
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
