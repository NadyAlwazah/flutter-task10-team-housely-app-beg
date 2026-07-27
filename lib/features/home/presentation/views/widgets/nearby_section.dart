import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/popular_property_card.dart';

class NearbySection extends StatelessWidget {
  const NearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Nearby', style: Styles.textStyle16W600Inter),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: Styles.textStyle12W500Inter.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        BlocBuilder<PropertyCubit, PropertyState>(
          builder: (context, state) {
            final properties = state.nearbyProperties;
            return SizedBox(
              height: 180.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: 16.w),
                itemCount: (properties.length / 2).ceil(),
                separatorBuilder: (_, _) => SizedBox(width: 12.w),
                itemBuilder: (context, index) {
                  final first = properties[index * 2];
                  final secondIndex = index * 2 + 1;
                  final second = secondIndex < properties.length
                      ? properties[secondIndex]
                      : null;

                  return SizedBox(
                    width: 240.w,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PopularPropertyCard(
                          width: 240.w,
                          height: 74.h,
                          padding: EdgeInsets.only(right: 8.w, bottom: 3.h),
                          showIconFavorite: false,
                          propertyModel: first,
                        ),

                        const Divider(
                          thickness: 0.5,
                          color: AppColors.textSecondary,
                        ),

                        if (second != null) ...[
                          PopularPropertyCard(
                            width: 240.w,
                            height: 74.h,
                            padding: EdgeInsets.only(right: 8.w, bottom: 3.h),
                            showIconFavorite: false,
                            propertyModel: second,
                          ),

                          const Divider(
                            thickness: 0.5,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
