import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/location_search_service.dart';
import 'custom_app_button.dart';

class MapPageBody extends StatelessWidget {
  final String address;
  final VoidCallback onChooseLocation;
  final Function(String) onSearch;

  final List<LocationResult> searchResults;
  final Function(LocationResult) onLocationSelected;

  const MapPageBody({
    super.key,
    required this.address,
    required this.onChooseLocation,
    required this.onSearch,
    required this.searchResults,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 32),
          _buildSearchBar(),

          const Spacer(),

          _buildLocationDetailsCard(),

          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.all(20.h),
            child: CustomAppButton(
              text: "Choose location",
              onPressed: onChooseLocation,
              textStyle: Styles.textStyle18W400Inter.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Column(
      children: [
        Container(
          height: 55.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: TextField(
            decoration: InputDecoration(
              icon: SvgPicture.asset(
                AssetsData.searchSvg,
                width: 24.w,
                height: 24.h,
              ),
              hintText: "Search Location",
              hintStyle: Styles.textStyle14W400Inter,
              border: InputBorder.none,
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                onSearch(value.trim());
              }
            },
          ),
        ),

        if (searchResults.isNotEmpty)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final result = searchResults[index];

                return ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.purple),
                  title: Text(
                    result.displayName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    onLocationSelected(result);
                  },
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildLocationDetailsCard() {
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 15)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Location Details", style: Styles.textStyle20W600Inter),
          ),

          SizedBox(height: 15.h),

          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4EBFF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  size: 18,
                  Icons.location_on_outlined,
                  color: AppColors.primary,
                ),
              ),

              SizedBox(width: 10.w),

              Flexible(
                child: Text(
                  address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14W400Inter.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
