import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/model/user_chat_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/chat_detail_view.dart';
import 'chat_item_tile.dart';
import 'delete_confirmation_dialog.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  late List<Map<String, String>> chatItems;

  @override
  void initState() {
    super.initState();
    chatItems = [
      {
        'name': 'Anggela',
        'message': 'Thank you for information',
        'time': '1:22 AM',
        'image': AssetsData.anggelaPng,
      },
      {
        'name': 'Theresa Webb',
        'message': 'Hi there, the price is negotiable',
        'time': '8:22 PM',
        'image': AssetsData.theresaPng,
      },
      {
        'name': 'Guy Hawkins',
        'message': 'Have a plan for discuss this ?',
        'time': '8:22 PM',
        'image': AssetsData.guyPng,
      },
      {
        'name': 'Savannah Nguyen',
        'message': 'Have a plan for discuss this ?',
        'time': '8:22 PM',
        'image': AssetsData.savannahPng,
      },
      {
        'name': 'Arlene McCoy',
        'message': 'Have a plan for discuss this ?',
        'time': '8:22 PM',
        'image': AssetsData.arlenePng,
      },
      {
        'name': 'Leslie Alexander',
        'message': 'Have a plan for discuss this ?',
        'time': '8:22 PM',
        'image': AssetsData.alexPng,
      },
    ];
  }

  void _showDeleteDialog(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DeleteConfirmationDialog(
          onDeleteConfirm: () {
            setState(() {
              chatItems.removeAt(index);
            });
          },
        );
      },
    );
  }
@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'All Message',
        style: Styles.textStyle16W600Inter.copyWith(color: AppColors.textPrimary),
      ),
      const SizedBox(height: 16),
    ListView.separated(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: chatItems.length,
  separatorBuilder: (context, index) => SizedBox(height: 12.h),
  itemBuilder: (context, index) {
    final item = chatItems[index];
    return ChatItemTile(
      name: item['name']!,
      message: item['message']!,
      time: item['time']!,
      image: item['image']!,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailView(
              user: UserChatModel(
                name: item['name'] ?? 'User',
                image: item['image'] ?? AssetsData.codyPng, 
                isOnline: true,
              ),
            ),
          ),
        );
      },
      onDeletePressed: () => _showDeleteDialog(index),
    );
  },
)
     
    ],
  );
}
}