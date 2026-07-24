import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/layout/bottom_nav_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/popular_property_card.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: "Favorite",
          onTapLeading: () {
            context.read<BottomNavCubit>().changeTab(0);
          },
        ),
        BlocBuilder<PropertyCubit, PropertyState>(
          builder: (context, state) {
            final properties = (state.popular + state.recommended)
                .where((property) => property.isFavorite)
                .toList();

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 16.h),
                  itemCount: properties.length,
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 0.5,
                    color: AppColors.textSecondary,
                  ),
                  itemBuilder: (context, index) {
                    final property = properties[index];

                    return PopularPropertyCard(
                      width: 327.w,
                      height: 72.h,
                      padding: EdgeInsets.only(right: 8.w),
                      image: property.image,
                      title: property.title,
                      location: property.location,
                      price: "\$${property.pricePerMonth}",
                      isFavorite: property.isFavorite,
                      rating: 4.2,
                      onTapFavorite: () {
                        context.read<PropertyCubit>().toggleFavorite(
                          property.id,
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
