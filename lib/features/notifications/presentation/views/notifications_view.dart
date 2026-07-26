import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/notifications/presentation/views/widgets/custom_notifications_appbar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/notifications/presentation/views/widgets/empty_notifications_view_body.dart';
import 'package:flutter_task10_team_housely_app_beg/features/notifications/presentation/views/widgets/notifications_view_body.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {

  bool _showNotifications = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {

      if (mounted) {
        setState(() {
          _showNotifications = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomNotificationsAppBar(),
      body: _showNotifications
          ? const NotificationsViewBody()
          : const EmptyNotificationsViewBody(),
    );
  }
}