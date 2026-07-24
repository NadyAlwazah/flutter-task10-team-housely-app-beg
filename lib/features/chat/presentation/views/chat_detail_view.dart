import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/model/user_chat_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/chat_detail_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/chat_detail_view_body.dart';

class ChatDetailView extends StatelessWidget {
  final UserChatModel? user;

  const ChatDetailView({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    final currentUser = user ??
        const UserChatModel(
          name: 'User',
          image: AssetsData.codyPng,
          isOnline: true,
        );

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: ChatDetailAppBar(
        user: currentUser,
      ),

     body: ChatDetailViewBody(
  user: currentUser,
),
    );
  }
}