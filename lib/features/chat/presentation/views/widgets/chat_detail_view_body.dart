import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/model/user_chat_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/recommended_property_card.dart';

class ChatDetailViewBody extends StatelessWidget {
  final UserChatModel? user;

  const ChatDetailViewBody({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PropertyModel propertyModel = PropertyModel(
      id: 999,
      title: 'Ayana Homestay',
      location: "Imogiri, Yogyakarta",
      image: AssetsData.imagCardPng,
      pricePerMonth: 310,
      rating: 4.5,
      bedrooms: 2,
      bathrooms: 2,
      buildYear: 2025,
      parking: 1,
      area: 1880,
      status: "For Rent",
      description: "Beautiful modern homestay with garden view.",
      reviews: [
        ReviewModel(
          reviewerName: "Theresa Webb",
          reviewerImage: AssetsData.imageProfilePng,
          rating: 4.5,
          comment: "Amazing place, very clean and cozy!",
        ),
      ],
      isFavorite: true,
    );
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 16.h),
                Center(
                  child: Text(
                    'Today',
                    style: Styles.textStyle16W600Inter.copyWith(
                      color: AppColors.nameChat,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                Container(
                  width: 224.w,
                  height: 164.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: RecommendedPropertyCard(propertyModel: propertyModel),
                ),

                SizedBox(height: 12.h),

                //chats
                Container(
                  width: 224.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.chatMessageContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                      bottomRight: Radius.zero,
                    ),
                  ),
                  child: Text(
                    'Hello we are interested in this how about the price ?',
                    style: Styles.textStyle14W400Inter.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '1:22 AM',
                  style: Styles.textStyle12W500Inter.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: 160.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.chatMessageContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                      bottomRight: Radius.zero,
                    ),
                  ),
                  child: Text(
                    'can it be negotiated ?  ',
                    style: Styles.textStyle14W400Inter.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '1:22 AM',
                  style: Styles.textStyle12W500Inter.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 42.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 44.r,
                      height: 44.r,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        user?.image ?? AssetsData.anggelaPng,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.person, size: 28.r),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 216.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.chatMessage2Container,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r),
                              bottomLeft: Radius.zero,
                            ),
                          ),
                          child: Text(
                            'Hi there, the price \nis negotiable',
                            style: Styles.textStyle12W400Inter.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '1:30 AM',
                          style: Styles.textStyle12W500Inter.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: AppColors.chatMessageContainer,
                size: 24.r,
              ),
              SizedBox(width: 11.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.chatMessage2Container,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'write your message',
                      hintStyle: Styles.textStyle12W400Poppins,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                width: 44.r,
                height: 44.r,
                decoration: const BoxDecoration(
                  color: AppColors.chatMessageContainer,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  width: 18.w,
                  height: 18.h,
                  AssetsData.iconSendSvg,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
