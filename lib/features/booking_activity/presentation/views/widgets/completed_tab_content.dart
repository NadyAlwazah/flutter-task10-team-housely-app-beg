import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:go_router/go_router.dart';
import 'booking_activity_card.dart';

class CompletedTabContent extends StatelessWidget {
  const CompletedTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      builder: (context, state) {
        // recommended ناخد أول عنصر بس من
        final List<PropertyModel> completedBookings =
            state.recommended.isNotEmpty
            ? [state.recommended.first]
            : <PropertyModel>[];

        if (completedBookings.isEmpty) {
          // الحالة الفارغة مع صورة Oops!
          return SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Image.asset(
                  AssetsData.imageMybookingoppsPng,
                  height: 220.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 36.h),
                Text(
                  'You have no completed booking',
                  style: Styles.textStyle20W600Inter.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' are you looking for a  ',
                          style: Styles.textStyle14W400Inter.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'upcoming',
                            style: Styles.textStyle14W400Inter.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        Text(
                          ' or ',
                          style: Styles.textStyle14W400Inter.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'cancelled',
                            style: Styles.textStyle14W400Inter.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      ' booking ?',
                      style: Styles.textStyle14W400Inter.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          itemCount: completedBookings.length,
          itemBuilder: (context, index) {
            final item = completedBookings[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // كارت العقار
                BookingActivityCard(
                  title: item.title,
                  location: item.location,
                  image: item.image,
                  dateOrPrice: '08 Aug - 12 Aug',
                  statusText: 'Completed',
                  statusColor: AppColors.greenStatusBackground,
                  statusTextColor: AppColors.greenTextStatus,
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () {
                    context.push(
                      AppRouter.kAddReview,
                      extra: {
                        'property': item,
                        'cubit': context.read<PropertyCubit>(),
                      },
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsData.iconChatbookingSvg,
                        width: 24.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.chatPurple,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      // زر Write review (أيقونة بنفسجي ونصوص رمادية)
                      Text(
                        'Write review',
                        style: Styles.textStyle12W400Inter.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                // خط فاصل بين Write review و Call Agent
                Divider(
                  color: AppColors.lightGrayBackground,
                  thickness: 1,
                  height: 4.h,
                ),
                SizedBox(height: 5.h),
                // زر Call Agent (أيقونة هاتف بنفسجي ونصوص رمادية)
                GestureDetector(
                  onTap: () {
                    context.push(AppRouter.kChatDetail);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsData.iconCallSvg,
                        width: 24.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.chatPurple,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Call Agent',
                        style: Styles.textStyle12W400Inter.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),

                // خط فاصل نهائي تحت هذا العنصر ليفصله عن العقار التالي
                Divider(
                  color: AppColors.lightGrayBackground,
                  thickness: 1,
                  height: 16.h,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
