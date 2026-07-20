// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
// import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

// class ProfileOptionsList extends StatelessWidget {
//   const ProfileOptionsList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final options = [
//       {'icon': AssetsData.iconSettingSvg, 'title': 'Settings'},
//       {'icon': AssetsData.iconWalletSvg, 'title': 'Payment'},
//       {'icon': AssetsData.iconNotificationSvg, 'title': 'Notification'},
//       {'icon': AssetsData.iconTimeSquareSvg, 'title': 'Recent Viewed'},
//       {'icon': AssetsData.iconInfoSquareSvg, 'title': 'About'},
//     ];

//     return Column(
//       children: options.map((item) {
//         return ListTile(
//           contentPadding: EdgeInsets.zero,
//           leading: SvgPicture.asset(item['icon']!),
//           title: Text(item['title']!, style: Styles.textStyle12W500Inter),
//           trailing: Icon(
//             Icons.arrow_forward_ios,
//             size: 16.r,
//             color: const Color(0xFFD2D6DB),
//           ),
//           onTap: () {

//           },
//         );
//       }).toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      {'icon': AssetsData.iconSettingSvg, 'title': 'Settings', 'route': null},
      {
        'icon': AssetsData.iconWalletSvg,
        'title': 'Payment',
        'route': AppRouter.kBookingPayment,
      },
      {
        'icon': AssetsData.iconNotificationSvg,
        'title': 'Notification',
        'route': AppRouter.kNotifications,
      },
      {
        'icon': AssetsData.iconTimeSquareSvg,
        'title': 'Recent Viewed',
        'route': null,
      },
      {'icon': AssetsData.iconInfoSquareSvg, 'title': 'About', 'route': null},
    ];

    return Column(
      children: options.map((item) {
        return ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(item['icon']!),
          title: Text(item['title']!, style: Styles.textStyle12W500Inter),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16.r,
            color: const Color(0xFFD2D6DB),
          ),
          onTap: () {
            if (item['route'] != null) {
              context.push(item['route']!);
            }
          },
        );
      }).toList(),
    );
  }
}
