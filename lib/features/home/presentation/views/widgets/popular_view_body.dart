import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext, BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/popular_property_card.dart';

class PopularViewBody extends StatelessWidget {
  const PopularViewBody({super.key, required this.onBackToHome});
  final VoidCallback onBackToHome;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: "Popular", onTapLeading: onBackToHome),

        BlocBuilder<PropertyCubit, PropertyState>(
          builder: (context, state) {
            final properties = state.popular;

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 16.h, top: 5),
                  itemCount: properties.length,

                  itemBuilder: (context, index) {
                    final property = properties[index];

                    return PopularPropertyCard(
                      width: 327.w,
                      height: 88.h,
                      padding: EdgeInsets.only(right: 8.w),
                      margin: EdgeInsets.only(bottom: 8.h),
                      propertyModel: property,
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
