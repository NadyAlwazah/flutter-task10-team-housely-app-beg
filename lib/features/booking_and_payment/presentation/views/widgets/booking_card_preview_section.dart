import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class BookingCardPreviewSection extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;

  const BookingCardPreviewSection({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      child: Stack(
        children: [
          // 1. الطبقة السفلية: لون البطاقة الأساسي
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: SvgPicture.asset(
                AssetsData.iconCardcolorSvg,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. الطبقة الوسطى: شكل الموجات/الظلال الخاصة بالبطاقة
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: SvgPicture.asset(
                AssetsData.iconCreditcardshSvg,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 3. طبقة المحتوى: الشعار والنصوص
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // الصف الأول: كلمة Credit Card وشعار البطاقة
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Credit Card',
                      style: Styles.textStyle14W400Inter.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // شعار البطاقة (الدائرتان) في الزاوية العلوية اليمنى
                    SvgPicture.asset(
                      AssetsData.iconAddcardlogoSvg,
                      width: 40.w,
                    ),
                  ],
                ),

                // الصف الثاني: رقم البطاقة
                Text(
                  cardNumber.isEmpty
                      ? '1234  5678  9101  1121'
                      : _formatCardNumber(cardNumber),
                  style: Styles.textStyle20W600Inter.copyWith(
                    color: Colors.white,
                    letterSpacing: 2,
                    fontSize: 22.sp,
                  ),
                ),

                // الصف الثالث: اسم حامل البطاقة وتاريخ الانتهاء
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardHolderName.isEmpty
                          ? 'Brooklyn Simmons'
                          : cardHolderName,
                      style: Styles.textStyle14W500Inter.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      expiryDate.isEmpty ? '06/21' : expiryDate,
                      style: Styles.textStyle14W500Inter.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatCardNumber(String number) {
    number = number.replaceAll(' ', ''); // إزالة أي مسافات موجودة
    if (number.length <= 4) return number;
    String formatted = '';
    for (int i = 0; i < number.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted += '  '; // إضافة مسافتين للوضوح
      }
      formatted += number[i];
    }
    return formatted;
  }
}
