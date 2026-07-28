import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/agent_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/recommended_property_card.dart';

class ChatMessageModel {
  final String text;
  final String time;
  final bool isSentByMe;

  ChatMessageModel({
    required this.text,
    required this.time,
    required this.isSentByMe,
  });
}

class ChatDetailViewBody extends StatefulWidget {
  final AgentModel? agent;

  const ChatDetailViewBody({Key? key, this.agent}) : super(key: key);

  @override
  State<ChatDetailViewBody> createState() => _ChatDetailViewBodyState();
}

class _ChatDetailViewBodyState extends State<ChatDetailViewBody> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessageModel> _messages = [];

  @override
  void initState() {
    super.initState();

    _messages.addAll([
      ChatMessageModel(
        text: 'Hello we are interested in this how about the price ?',
        time: '1:22 AM',
        isSentByMe: true,
      ),
      ChatMessageModel(
        text: 'can it be negotiated ?',
        time: '1:22 AM',
        isSentByMe: true,
      ),
      ChatMessageModel(
        text: 'Hi there, the price is negotiable',
        time: '1:30 AM',
        isSentByMe: false,
      ),
    ]);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Widget _buildSentMessage({required String text, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 224.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
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
              text,
              style: Styles.textStyle14W400Inter.copyWith(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          time,
          style: Styles.textStyle12W500Inter.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _buildReceivedMessage({required String text, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44.r,
              height: 44.r,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                widget.agent?.image ?? AssetsData.anggelaPng,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.person, size: 28.r),
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 216.w),
                  child: Container(
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
                      text,
                      style: Styles.textStyle12W400Inter.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  time,
                  style: Styles.textStyle12W500Inter.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  void _sendMessage() {
    final String text = _messageController.text.trim();
    if (text.isNotEmpty) {
      final now = TimeOfDay.now();
      final String formattedTime =
          '${now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod}:${now.minute.toString().padLeft(2, '0')} ${now.period == DayPeriod.am ? 'AM' : 'PM'}';

      setState(() {
        _messages.add(
          ChatMessageModel(text: text, time: formattedTime, isSentByMe: true),
        );
      });

      _messageController.clear();
    }
  }

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
      agent: AgentModel(
        image: widget.agent?.image ?? AssetsData.imageAgentPng,
        name: widget.agent?.name ?? "Theresa Webb",
        role: widget.agent?.role ?? "Property Agent",
      ),
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
                SizedBox(height: 16.h),
                ..._messages.map((msg) {
                  if (msg.isSentByMe) {
                    return _buildSentMessage(text: msg.text, time: msg.time);
                  } else {
                    return _buildReceivedMessage(
                      text: msg.text,
                      time: msg.time,
                    );
                  }
                }).toList(),
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
                    controller: _messageController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'write your message',
                      hintStyle: Styles.textStyle12W400Poppins,
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: _sendMessage,
                child: Container(
                  width: 44.r,
                  height: 44.r,
                  decoration: const BoxDecoration(
                    color: AppColors.chatMessageContainer,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AssetsData.iconSendSvg,
                    width: 18.w,
                    height: 18.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
