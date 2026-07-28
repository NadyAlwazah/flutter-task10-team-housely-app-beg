import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/chat_list_view_body.dart';
import 'package:go_router/go_router.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Message',
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AssetsData.searchSvg,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
        onTapLeading: () {
          context.pop();
        },
      ),
      body: const ChatListViewBody(),
    );
  }
}
