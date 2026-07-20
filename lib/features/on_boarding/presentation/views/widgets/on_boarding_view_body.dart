import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/features/on_boarding/data/on_boarding_data.dart';
import 'package:flutter_task10_team_housely_app_beg/features/on_boarding/presentation/views/widgets/on_boarding_item.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/features/on_boarding/presentation/views/widgets/dot_indicator.dart';
import 'skip_button.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 50.h, right: 24.w),
            child: currentIndex < 2
                ? SkipButton(
                    onPressed: () {
                      context.go(AppRouter.kSignin);
                    },
                  )
                : SizedBox(height: 50.h),
          ),
        ),

        Expanded(
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return OnBoardingPageItem(
                data: onBoardingPages[index],
                index: index,
              );
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => DotIndicator(isActive: currentIndex == index),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: CustomButton(
            text: currentIndex == 2 ? "Get Started" : "Next",
            onPressed: () {
              if (currentIndex < 2) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                context.go(AppRouter.kSignin);
              }
            },
          ),
        ),
      ],
    );
  }
}
