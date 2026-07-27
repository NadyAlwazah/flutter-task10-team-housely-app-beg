import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PropertyImagesSlider extends StatefulWidget {
  const PropertyImagesSlider({super.key, required this.images});

  final List<String> images;

  @override
  State<PropertyImagesSlider> createState() => _PropertyImagesSliderState();
}

class _PropertyImagesSliderState extends State<PropertyImagesSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //   السلايدر + المؤشر فوقه
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: SizedBox(
                  height: 232.h,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.images.length,
                    onPageChanged: (index) {
                      setState(() => _currentIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),

              //   المؤشر
              Positioned(
                bottom: 24.h,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.images.length,
                  effect: WormEffect(
                    dotHeight: 8.h,
                    dotWidth: 8.w,
                    activeDotColor: AppColors.primary,
                    dotColor: const Color(0XFFD2D6DB),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 12.h),

        //   الصور المصغّرة
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: SizedBox(
            height: 72.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              separatorBuilder: (_, _) => SizedBox(width: 8.w),
              itemBuilder: (context, index) {
                final isSelected = index == _currentIndex;

                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Image.asset(
                        widget.images[index],
                        width: 76.w,
                        height: 72.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
