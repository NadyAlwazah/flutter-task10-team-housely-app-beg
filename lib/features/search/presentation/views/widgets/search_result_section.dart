import 'package:awesome_dialog/awesome_dialog.dart';
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
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/empty_search_result.dart';
import 'package:go_router/go_router.dart';

class SearchResultSection extends StatefulWidget {
  const SearchResultSection({super.key});

  @override
  State<SearchResultSection> createState() => _SearchResultSectionState();
}

class _SearchResultSectionState extends State<SearchResultSection> {
  @override
  void initState() {
    super.initState();
    context.read<PropertyCubit>().loadRecentProperties();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      builder: (context, state) {
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
                    property: property,
                    query: query,
                    icon: AssetsData.iconTimeCircleSvg,
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
                    property: property,
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
              ],

              // Empty State
              if (recentResults.isEmpty && searchResults.isEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 90.0.h),
                  child: const Center(child: EmptySearchResult()),
                ),
            ],
          ),
        );
      },
    );
  }

  // Result Item Builder
  Widget _buildResultItem({
    required PropertyModel property,
    required String icon,
    required String title,
    required String location,
    required VoidCallback onTap,
    required String query,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: onTap,
        onLongPress: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.scale,
            title: "Delete Recent",
            desc: "Are you sure you want to remove this item from recent?",
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              context.read<PropertyCubit>().removeRecentItem(property);
            },
          ).show();
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 12.h),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFE5E7EB), width: 0.5),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 24.r,
                height: 24.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.textPrimary,
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
                      text: _highlightText(title, query, isTitle: true),
                    ),
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: _highlightText(location, query, isTitle: false),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _highlightText(String text, String query, {required bool isTitle}) {
    // Default styles
    final defaultStyle = isTitle
        ? Styles.textStyle14W600Inter
        : Styles.textStyle12W400Inter;

    // Highlight styles
    final highlightStyle = isTitle
        ? Styles.textStyle14W600Inter.copyWith(color: AppColors.primary)
        : Styles.textStyle12W400Inter.copyWith(color: AppColors.primary);

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
