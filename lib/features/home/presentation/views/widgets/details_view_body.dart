import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/property_agent_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/property_details_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/property_images_slider.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/property_location_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/property_reviews_section.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.propertyModel});

  final PropertyModel propertyModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PropertyImagesSlider(
            images: [
              propertyModel.image,
              AssetsData.imageDetails1Png,
              AssetsData.imageDetails2Png,
              AssetsData.imageDetails3Png,
              AssetsData.imageDetails4Png,
            ],
          ),

          SizedBox(height: 24.h),
          PropertyDetailsSection(property: propertyModel),

          SizedBox(height: 24.h),
          const PropertyAgentSection(
            image: AssetsData.imageAgentPng,
            name: "Esther Howard",
            role: " Real Estate Agent",
          ),
          SizedBox(height: 24.h),
          const PropertyLocationSection(),

          SizedBox(height: 24.h),
          PropertyReviewsSection(property: propertyModel),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
