import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';

class StoriesSection extends StatelessWidget {
  final List<String> svgAssets;

  const StoriesSection({
    Key? key,
    required this.svgAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.r,
      child: Row(
        children: [
          Container(
            width: 52.r,
            height: 52.r,
            alignment: Alignment.center,
           
              decoration: const BoxDecoration(
                color: AppColors.chatMessageContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 24.r,
         
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            height: 43.5.h,
            width: 0,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.textSecondary,
                width: 0.5.w,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: svgAssets.length,
              separatorBuilder: (context, index) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                return Container(
                  width: 52.r,
                  height: 52.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.chatMessageContainer,
                      width: 2.0.w,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      svgAssets[index],
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.person, size: 28.r),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}