import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/notifications/presentation/views/widgets/natifications_list_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/notifications/presentation/views/widgets/notifications_item_tile.dart';


class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 24.w, right: 24.r),
      child: Column(
        children: [
          NotificationsListView(
            title: 'Today',
            items: [
              NotificationItemTile(
                imagePath: AssetsData.iconNotificationSvg,
                textSpan: TextSpan(
                  style: Styles.textStyle12W400Inter,
                  children: [
                    const TextSpan(text: 'Congratulations, your listing is now active. '),
                    TextSpan(
                      text: 'click here to see your listing',
                      style: Styles.textStyle12W500Inter,
                    ),
                  ],
                ),
              ),
              NotificationItemTile(
                imagePath: AssetsData.iconNotificationSvg,
                textSpan: TextSpan(
                  text: 'Welcome, Don’t forget to complete your personal \ninfo',
                  style:  Styles.textStyle12W400Inter,
                ),
              ),
            ],
          ),

          NotificationsListView(
            title: 'Yesterday',
            items: [
              NotificationItemTile(
                imagePath: AssetsData.anggelaPng,
                imageType: NotificationImageType.png,
                hasRedDot: false,
                textSpan: TextSpan(
                  style: Styles.textStyle12W400Inter,
                  children: [
                    TextSpan(
                      text: 'Anggela and joni ',
                      style: Styles.textStyle12W500Inter,
                    ),
                    const TextSpan(text: 'send you message, check it now'),
                  ],
                ),
              ),

              NotificationItemTile(
                imagePath: AssetsData.iconNotificationSvg,
                textSpan: TextSpan(
                  text: 'Welcome, Don’t forget to complete your personal info',
                  style: Styles.textStyle12W400Inter,
                ),
              ),


              NotificationItemTile(
                imagePath: AssetsData.iconProfileSvg,
                hasRedDot: false,
                textSpan: TextSpan(
                  text: 'Welcome, Don’t forget to complete your personal info',
                  style: Styles.textStyle12W400Inter,
                ),
              ),


              NotificationItemTile(
                imagePath: AssetsData.imageAgentPng,
                imageType: NotificationImageType.png,
                hasRedDot: false,
                textSpan: TextSpan(
                  style: Styles.textStyle12W400Inter,
                  children: [
                    TextSpan(
                      text: 'Jhon, ani & 2 other ',
                      style: Styles.textStyle12W500Inter,
                    ),
                    const TextSpan(text: 'send you message, check it now'),
                  ],
                ),
              ),


              NotificationItemTile(
                imagePath:AssetsData.iconProfileSvg,
                hasRedDot: false,
                textSpan: TextSpan(
                  text: 'Welcome, Don’t forget to complete your personal info',
                  style: Styles.textStyle12W400Inter,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}