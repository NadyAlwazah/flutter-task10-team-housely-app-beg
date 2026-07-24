import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/messages_list.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/stories_section.dart';

class ChatListViewBody extends StatelessWidget {
  const ChatListViewBody({Key? key}) : super(key: key);

  final List<String> storiesSvgList = const [
    AssetsData.imag1chatPng,
    AssetsData.imag2chatPng,
    AssetsData.imag3chatPng,
    AssetsData.imag4chatPng,
    AssetsData.imag5chatPng,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [ 
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StoriesSection(
                  svgAssets: storiesSvgList,
                ),
                SizedBox(height: 26.h),
              ],
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: MessageList(),
          ),
        ),
      ],
    );
  }
}