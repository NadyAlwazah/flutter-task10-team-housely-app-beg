import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/recommended_property_card.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recommended', style: Styles.textStyle16W600Inter),

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
            final properties = state.recommended;

            return SizedBox(
              height: 164.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: 16.w), //!  فراغ بعد آخر عنصر
                itemCount: properties.length,
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                itemBuilder: (context, index) {
                  final property = properties[index];

                  return RecommendedPropertyCard(
                    image: property.image,
                    title: property.title,
                    location: property.location,
                    price: "\$${property.pricePerMonth}",
                    isFavorite: property.isFavorite,
                    onTapFavorite: () {
                      context.read<PropertyCubit>().toggleFavorite(property.id);
                    },
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
