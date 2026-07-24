import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/chat_list_view_body.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/custom_app_bar.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: ChatListViewBody(),
    );
  }
}