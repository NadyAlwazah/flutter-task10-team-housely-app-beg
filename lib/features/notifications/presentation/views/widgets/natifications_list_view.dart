import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/notifications/presentation/views/widgets/notifications_item_tile.dart';

class NotificationsListView extends StatelessWidget {
  final String title;
  final List<NotificationItemTile> items;

  const NotificationsListView({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:Styles.textStyle16W600Inter
        ),


        SizedBox(height: 16.h),

        
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => items[index],
        ),
      ],
    );
  }
}