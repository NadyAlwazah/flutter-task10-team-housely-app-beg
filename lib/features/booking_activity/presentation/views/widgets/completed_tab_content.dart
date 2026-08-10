import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_activity/presentation/views/widgets/empty_booking.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/data/manager/profile_cubit/profile_cubit.dart';
import 'package:go_router/go_router.dart';
import 'booking_activity_card.dart';

class CompletedTabContent extends StatefulWidget {
  const CompletedTabContent({super.key});

  @override
  State<CompletedTabContent> createState() => _CompletedTabContentState();
}

class _CompletedTabContentState extends State<CompletedTabContent> {
  @override
  void initState() {
    super.initState();

    context.read<ProfileCubit>().loadUser();
  }

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
          return const EmptyBookingWidget(tabType: 'completed');
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

                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, profileState) {
                    return GestureDetector(
                      onTap: () {
                        if (profileState is ProfileLoaded) {
                          context.push(
                            AppRouter.kAddReview,
                            extra: {
                              'property': item,
                              'cubit': context.read<PropertyCubit>(),
                            },
                          );
                        } else {
                          debugPrint(
                            'Profile is not loaded. Current state: $profileState',
                          );
                        }
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
                          Text(
                            'Write review',
                            style: Styles.textStyle12W400Inter.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
