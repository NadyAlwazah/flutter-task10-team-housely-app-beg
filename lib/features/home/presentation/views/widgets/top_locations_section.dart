import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/top_location_item.dart';

class TopLocationsSection extends StatefulWidget {
  const TopLocationsSection({super.key});

  @override
  State<TopLocationsSection> createState() => _TopLocationsSectionState();
}

class _TopLocationsSectionState extends State<TopLocationsSection> {
  int selectedIndex = 1;

  final List<Map<String, String>> topLocations = [
    {'name': 'Malang', 'image': AssetsData.imageTopLocation1Png},
    {'name': 'Bali', 'image': AssetsData.imageTopLocation2Png},
    {'name': 'Yogyakarta', 'image': AssetsData.imageTopLocation3Png},
    {'name': 'Yogyakarta', 'image': AssetsData.imageTopLocation1Png},
    {'name': 'Yogyakarta', 'image': AssetsData.imageTopLocation2Png},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Top Locations', style: Styles.textStyle16W600Inter),
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
        SizedBox(
          height: 44.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: topLocations.length,
            padding: EdgeInsets.only(right: 16.w),
            separatorBuilder: (_, _) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final location = topLocations[index];
              final isSelected = index == selectedIndex;

              return TopLocationItem(
                image: location['image']!,
                name: location['name']!,
                isSelected: isSelected,
                onTap: () => setState(() => selectedIndex = index),
              );
            },
          ),
        ),
      ],
    );
  }
}
