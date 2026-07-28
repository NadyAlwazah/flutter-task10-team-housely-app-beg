import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class BookingPriceDetailsSection extends StatelessWidget {
  final double monthlyPrice;
  final double tax;
  final DateTime? startDate;
  final DateTime? endDate;

  const BookingPriceDetailsSection({
    super.key,
    required this.monthlyPrice,
    this.tax = 10.00,
    this.startDate,
    this.endDate,
  });

  // حساب عدد الأيام ديناميكياً بين تاريخ البداية والنهاية
  int _calculateDays() {
    if (startDate != null && endDate != null) {
      return endDate!.difference(startDate!).inDays + 1;
    } else if (startDate != null && endDate == null) {
      return 1; // إذا تم اختيار يوم واحد فقط
    }
    return 30; // افتراضياً شهر كامل (30 يوماً) إذا لم يتم الاختيار
  }

  @override
  Widget build(BuildContext context) {
    int days = _calculateDays();

    // تحديد النص المعروض للـ Period time
    String periodText;
    if (startDate != null && endDate != null) {
      if (days == 30 || days == 31) {
        periodText = '1 Month';
      } else {
        periodText = '$days ${days == 1 ? 'Day' : 'Days'}';
      }
    } else if (startDate != null) {
      periodText = '1 Day';
    } else {
      periodText = '1 Month';
    }

    // حساب السعر بناءً على عدد الأيام (سعر اليوم = سعر الشهر / 30)
    double dailyPrice = monthlyPrice / 30;
    double periodPayment = (startDate != null)
        ? (dailyPrice * days)
        : monthlyPrice;
    double total = periodPayment + tax;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Period time',
              style: Styles.textStyle12W500Inter.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
              ),
            ),
            Text(
              periodText, //  يتغير ديناميكياً بناءً على الأيام أو يبقى 1 Month
              style: Styles.textStyle12W400Inter.copyWith(
                color: AppColors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Monthly payment',
              style: Styles.textStyle12W500Inter.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
              ),
            ),
            Text(
              '\$${periodPayment.toStringAsFixed(2)}', //  السعر محسوب ديناميكياً
              style: Styles.textStyle12W400Inter.copyWith(
                color: AppColors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax',
              style: Styles.textStyle12W500Inter.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
              ),
            ),
            Text(
              '\$${tax.toStringAsFixed(2)}', //  ضريبة ثابتة
              style: Styles.textStyle12W400Inter.copyWith(
                color: AppColors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Styles.textStyle12W500Inter.copyWith(fontSize: 15.sp),
            ),
            Text(
              '\$${total.toStringAsFixed(2)}', //  المجموع الكلي الديناميكي بدلاً من القيمة الثابتة
              style: Styles.textStyle16W600Inter.copyWith(
                color: AppColors.primary,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
