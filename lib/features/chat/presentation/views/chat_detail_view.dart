import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/chat_detail_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/chat_detail_view_body.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/agent_model.dart';

class ChatDetailView extends StatelessWidget {
  final AgentModel? agent;

  const ChatDetailView({
    super.key,
    this.agent,
  });

  @override
  Widget build(BuildContext context) {
    final currentUser = agent ??
        AgentModel(
          name: 'User',
          image: AssetsData.codyPng,
          isOnline: true,
          role: "d",
        );

    return Scaffold(
      appBar: ChatDetailAppBar(
        agent: currentUser,
      ),
      body: ChatDetailViewBody(
        agent: currentUser,
      ),
    );
  }
}