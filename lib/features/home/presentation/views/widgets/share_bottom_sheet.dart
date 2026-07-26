import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> shareOptions = [
      {
        "icon": FontAwesomeIcons.facebookF,
        "label": "Facebook",
        "color": const Color(0xFF537ACB),
      },
      {
        'icon': FontAwesomeIcons.instagram,
        'label': 'Instagram',
        'gradient': const LinearGradient(
          colors: [Color(0xFFFBDA61), Color(0xFFC850C0)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      },
      {
        "icon": FontAwesomeIcons.twitter,
        "label": "Twitter",
        "color": const Color(0xFF13B9ED),
      },
      {
        "icon": FontAwesomeIcons.whatsapp,
        "label": "Whatsapp",
        "color": const Color(0xFF25D366),
      },
      {
        "icon": FontAwesomeIcons.linkedinIn,
        "label": "Linkedin",
        "color": const Color(0xFF006599),
      },
      {
        "icon": FontAwesomeIcons.pinterestP,
        "label": "Pinterest",
        "color": const Color(0xFFB42318),
      },
    ];

    return Container(
      height: 345.h,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h),

          /// Handle
          Container(
            width: 42.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),

          SizedBox(height: 16.h),

          Text("Share to", style: Styles.textStyle16W600Inter),

          SizedBox(height: 32.h),

          Expanded(
            child: GridView.builder(
              itemCount: shareOptions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                final item = shareOptions[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 57.r,
                      height: 53.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: item["color"],
                        gradient: item["gradient"],
                      ),
                      child: Center(
                        child: FaIcon(
                          item["icon"],
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(item["label"], style: Styles.textStyle12W600Inter),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
