import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/home_content_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/popular_property_card.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular for you', style: Styles.textStyle16W600Inter),

            GestureDetector(
              onTap: () {
                context.read<HomeContentCubit>().showPopular();
              },
              child: Text(
                'See all',
                style: Styles.textStyle12W500Inter.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        BlocBuilder<PropertyCubit, PropertyState>(
          builder: (context, state) {
            final properties = state.popular;
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 16.h),
              itemCount: properties.length > 4 ? 4 : properties.length,
              itemBuilder: (context, index) {
                final property = properties[index];

                return PopularPropertyCard(
                  width: 327.w,
                  height: 88.h,
                  padding: EdgeInsets.only(bottom: 16.h, right: 8.w),
                  margin: EdgeInsets.only(bottom: 8.h),
                  propertyModel: property,
                  onTapFavorite: () {
                    context.read<PropertyCubit>().toggleFavorite(property.id);
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
