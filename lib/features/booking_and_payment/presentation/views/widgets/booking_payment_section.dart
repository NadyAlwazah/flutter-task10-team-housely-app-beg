import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class BookingPaymentSection extends StatelessWidget {
  final String? selectedCard;
  final VoidCallback onAddCardTap;
  final VoidCallback onPayPalTap;

  const BookingPaymentSection({
    super.key,
    required this.selectedCard,
    required this.onAddCardTap,
    required this.onPayPalTap,
  });

  @override
  Widget build(BuildContext context) {
    // هل تم اختيار PayPal أو بطاقة؟
    bool isPayPalSelected = selectedCard == "PayPal Connected";
    bool isCardSelected =
        selectedCard != null && selectedCard!.isNotEmpty && !isPayPalSelected;

    // استخراج آخر 4 أرقام من البطاقة إن وجدت
    String lastFourDigits = '';
    if (isCardSelected) {
      String cleanNumber = selectedCard!.replaceAll(' ', '');
      if (cleanNumber.length >= 4) {
        lastFourDigits = cleanNumber.substring(cleanNumber.length - 4);
      } else {
        lastFourDigits = cleanNumber;
      }
    }

    return Column(
      children: [
        // 1. قسم بطاقة الائتمان (يختفي إذا تم اختيار PayPal، ويظهر شكله المضاف إذا تم اختيار البطاقة)
        if (!isPayPalSelected) ...[
          InkWell(
            onTap: onAddCardTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  if (!isCardSelected) ...[
                    // الشكل الافتراضي لبطاقة الائتمان
                    Container(
                      width: 36.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        color: AppColors.Secondary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AssetsData.iconCreditcardSvg,
                          width: 24.w,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'Credit or Debit card',
                        style: Styles.textStyle14W400Inter.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Icon(Icons.add, color: AppColors.textSecondary, size: 24.r),
                  ] else ...[
                    // الشكل بعد إضافة البطاقة
                    SvgPicture.asset(
                      AssetsData.iconCreditreservepaySvg,
                      width: 42.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        '........$lastFourDigits',
                        style: Styles.textStyle14W600Inter.copyWith(
                          letterSpacing: 2,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Text(
                      'Edit',
                      style: Styles.textStyle14W600Inter.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
        // 2. قسم الـ PayPal (يختفي إذا تم اختيار البطاقة، ويظهر متصلاً إذا تم اختياره)
        if (!isCardSelected) ...[
          InkWell(
            onTap: onPayPalTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: AppColors.Secondary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AssetsData.iconPaypalSvg,
                        width: 24.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      isPayPalSelected ? 'PayPal Connected' : 'PayPal',
                      style: Styles.textStyle14W400Inter.copyWith(
                        color: isPayPalSelected
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        fontSize: 16.sp,
                        fontWeight: isPayPalSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                  if (!isPayPalSelected)
                    Icon(Icons.add, color: AppColors.textSecondary, size: 24.r)
                  else
                    Text(
                      'Edit',
                      style: Styles.textStyle14W600Inter.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
