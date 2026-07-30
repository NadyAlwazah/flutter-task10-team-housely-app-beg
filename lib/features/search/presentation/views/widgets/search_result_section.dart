import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:go_router/go_router.dart';

class SearchResultSection extends StatelessWidget {
  const SearchResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      builder: (context, state) {
        // fix null
        final recentResults = state.recentSearches ?? [];
        final searchResults = state.filteredProperties ?? [];
        final query = context.read<PropertyCubit>().currentQuery;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recent Searches
              if (recentResults.isNotEmpty) ...[
                Text("Recent", style: Styles.textStyle16W600Inter),
                SizedBox(height: 12.h),

                ...recentResults.map(
                  (property) => _buildResultItem(
                    query: query,
                    icon: AssetsData.iconLocationOutlinedSvg,
                    title: property.title,
                    location: property.location,
                    onTap: () {
                      context.push(
                        AppRouter.kDetails,
                        extra: {
                          'property': property,
                          'cubit': context.read<PropertyCubit>(),
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 24.h),
              ],

              // Search Results
              if (searchResults.isNotEmpty) ...[
                Text("Result", style: Styles.textStyle16W600Inter),
                SizedBox(height: 12.h),

                ...searchResults.map(
                  (property) => _buildResultItem(
                    query: query,
                    icon: AssetsData.iconLocationSvg,
                    title: property.title,
                    location: property.location,
                    onTap: () {
                      context.push(
                        AppRouter.kDetails,
                        extra: {
                          'property': property,
                          'cubit': context.read<PropertyCubit>(),
                        },
                      );
                    },
                  ),
                ),
              ],

              // Empty State
              if (recentResults.isEmpty && searchResults.isEmpty)
                Center(
                  child: Text(
                    "No results found",
                    style: Styles.textStyle14W400Inter.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // Result Item Builder
  Widget _buildResultItem({
    required String icon,
    required String title,
    required String location,
    required VoidCallback onTap,
    required String query,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24.r,
              height: 24.r,
              colorFilter: const ColorFilter.mode(
                AppColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: _highlightText(title, query),
                  ),
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: _highlightText(location, query),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextSpan _highlightText(String text, String query) {
    final defaultStyle = Styles.textStyle12W600Inter.copyWith(
      color: AppColors.textPrimary,
    );

    final highlightStyle = Styles.textStyle12W600Inter.copyWith(
      color: AppColors.primary,
    );

    if (query.isEmpty) {
      return TextSpan(text: text, style: defaultStyle);
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();

    final startIndex = lowerText.indexOf(lowerQuery);

    if (startIndex == -1) {
      return TextSpan(text: text, style: defaultStyle);
    }

    return TextSpan(
      children: [
        TextSpan(text: text.substring(0, startIndex), style: defaultStyle),
        TextSpan(
          text: text.substring(startIndex, startIndex + query.length),
          style: highlightStyle,
        ),
        TextSpan(
          text: text.substring(startIndex + query.length),
          style: defaultStyle,
        ),
      ],
    );
  }
}
