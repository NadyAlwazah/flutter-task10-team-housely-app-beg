import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:go_router/go_router.dart';

class PropertyAgentSection extends StatelessWidget {
  const PropertyAgentSection({super.key, required this.propertyModel});

  final PropertyModel propertyModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Agent", style: Styles.textStyle16W600Inter),
          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // صورة الوكيل + الاسم + المسمى الوظيفي
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    child: Image.asset(
                      propertyModel.agent.image,
                      width: 52.r,
                      height: 52.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        propertyModel.agent.name,
                        style: Styles.textStyle14W600Inter,
                      ),
                      Text(
                        propertyModel.agent.role,
                        style: Styles.textStyle12W400Inter,
                      ),
                    ],
                  ),
                ],
              ),

              //  الاتصال والرسائل
              Row(
                children: [
                  _buildActionIcon(AssetsData.iconCallSvg, () {
                    context.push(
                      AppRouter.kChatDetail,
                      extra: {'agent': propertyModel.agent},
                    );
                  }),
                  SizedBox(width: 8.w),
                  _buildActionIcon(AssetsData.iconChatSvg, () {
                    context.push(
                      AppRouter.kChatDetail,
                      extra: {'agent': propertyModel.agent},
                    );
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(String icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.r,
        height: 36.r,

        decoration: const BoxDecoration(
          color: AppColors.iconContainerBackground,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 24.r,
            height: 24.r,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
