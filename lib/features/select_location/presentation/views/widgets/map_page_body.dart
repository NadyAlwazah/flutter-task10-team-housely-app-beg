import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'custom_app_button.dart';

class MapPageBody extends StatelessWidget {
  final String address;
  final VoidCallback? onChooseLocation;
  final VoidCallback? onBackPressed;
  final bool hideChooseLocationButton;
  final String cardTitle;
  final IconData cardIcon;

  const MapPageBody({
    super.key,
    required this.address,
    this.onChooseLocation,
    this.onBackPressed,
    this.hideChooseLocationButton = false,
    this.cardTitle = "Location Details",
    this.cardIcon = Icons.location_on_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textPrimary,
                  size: 24,
                ),
                onPressed: onBackPressed ??
                    () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
              ),
            ),
          ),
          SizedBox(height: 20.h),
          _buildSearchBar(),
          const Spacer(),
          _buildLocationDetailsCard(),
          if (!hideChooseLocationButton) ...[
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomAppButton(
                text: "Choose location",
                onPressed: onChooseLocation ?? () {},
                textStyle: Styles.textStyle18W400Inter.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50.h,
      width: 327.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.textCard,
          width: 1.w,
        ),
      ),
      child: TextField(
        readOnly: true,
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
      ),
    );
  }

  Widget _buildLocationDetailsCard() {
    return Container(
      width: 327.w,
      height: 149.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.textCard,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.18),
            offset: Offset(0, 24.h),
            blurRadius: 48.r,
            spreadRadius: -12.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cardTitle,
            style: Styles.textStyle20W600Inter,
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4EBFF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  cardIcon,
                  size: 18.r,
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