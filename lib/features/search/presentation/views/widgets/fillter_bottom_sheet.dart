import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/app_loader.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_bottom_buttons_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_facilities_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_looking_for_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_price_range_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_property_type_section.dart';
import 'package:go_router/go_router.dart';

class FillterBottomSheet extends StatelessWidget {
  const FillterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FilterCubit, FilterState>(
      listener: (context, state) {
        if (state is FilterLoading) {
          // Show loading indicator
          showDialog(
            context: context,
            builder: (_) => const Center(child: AppLoader()),
          );
        } else if (state is FilterSuccess) {
          Navigator.pop(context); // loading إغلاق ال

          context.push(
            AppRouter.kFileterdProperties,
            extra: {
              'minPrice': state.request.minPrice,
              'maxPrice': state.request.maxPrice,
              'facilities': state.request.facilities,
              'lookingFor': state.request.lookingFor,
              'propertyTypes': state.request.propertyTypes,
              'cubit': context.read<PropertyCubit>(),
            },
          );
        } else if (state is FilterError) {
          Navigator.pop(context); // loading إغلاق ال
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Container(
        height: 752.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 16.h),

              Container(
                width: 42.w,
                height: 7.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),

              SizedBox(height: 16.h),

              Center(
                child: Text("Fillter", style: Styles.textStyle16W600Inter),
              ),

              SizedBox(height: 16.h),

              const FilterLookingForSection(),

              SizedBox(height: 24.h),

              const FilterPropertyTypeSection(),

              SizedBox(height: 24.h),

              const FilterPriceRangeSection(),

              SizedBox(height: 24.h),
              const FilterFacilitiesSection(),

              SizedBox(height: 40.h),
              const FilterBottomButtonsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
