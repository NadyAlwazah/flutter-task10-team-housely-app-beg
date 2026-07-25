import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.propertyModel});
  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Details",
        onTapLeading: () {
          context.pop();
        },
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              AssetsData.iconShareSvg,
              width: 24.r,
              height: 24.r,
            ),
          ),
          BlocBuilder<PropertyCubit, PropertyState>(
            builder: (context, state) {
              final property = [
                ...state.recommended,
                ...state.popular,
              ].firstWhere((e) => e.id == propertyModel.id);

              return GestureDetector(
                onTap: () {
                  context.read<PropertyCubit>().toggleFavorite(property.id);
                },
                child: SvgPicture.asset(
                  property.isFavorite
                      ? AssetsData.iconFavoriteRedSvg
                      : AssetsData.iconFavoriteSvg,
                  width: 24.r,
                  height: 24.r,
                  colorFilter: ColorFilter.mode(
                    property.isFavorite
                        ? const Color(0xFFF97066)
                        : AppColors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: const DetailsViewBody(),
    );
  }
}
