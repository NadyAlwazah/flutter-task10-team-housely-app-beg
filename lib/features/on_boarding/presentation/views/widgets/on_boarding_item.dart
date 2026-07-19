import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/on_boarding/data/on_boarding_model.dart';

class OnBoardingPageItem extends StatelessWidget {
  final OnBoardingModel data;
  final int index;

  const OnBoardingPageItem({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isSecondPage = index == 1;

    return Column(
      children: [
        SizedBox(
          height: 380.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // الصورة الخلفية المظللة
              Positioned(
                left: isSecondPage ? 50.w : null,
                right: isSecondPage ? null : 50.w,
                top: 100.h,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    AppColors.primary.withOpacity(0.4),
                    BlendMode.srcATop,
                  ),
                  child: Container(
                    width: 180.w,
                    height: 260.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      image: DecorationImage(
                        image: AssetImage(data.image2),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // الصورة الأمامية الواضحة
              Positioned(
                left: isSecondPage ? null : 15.w,
                right: isSecondPage ? 15.w : null,
                top: 0.h,
                child: Container(
                  width: 250.w,
                  height: 350.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    image: DecorationImage(
                      image: AssetImage(data.image1),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.h),
        _buildTitle(data.title),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            data.subTitle,
            textAlign: TextAlign.center,
            style: Styles.textStyle14W400Inter,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String title) {
    // منطق تلوين الكلمات الغامقة بناءً على موقعها في الجملة
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: _buildTextSpans(title)),
      ),
    );
  }

  List<TextSpan> _buildTextSpans(String title) {
    final boldWords = ["dream", "home", "one", "click", "perfect", "place"];
    return title.split(" ").map((word) {
      bool isBold = boldWords.contains(word.toLowerCase());
      return TextSpan(
        text: "$word ",
        style: isBold
            ? Styles.textStyle24W600Inter.copyWith(
                color: AppColors.textPrimary,
                fontSize: 24.sp,
              )
            : Styles.textStyle24W400Inter.copyWith(
                color: AppColors.textPrimary,
              ),
      );
    }).toList();
  }
}
