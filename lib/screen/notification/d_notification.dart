import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/notification_dummy.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

class NotificationDialog extends DialogWidget {
  final List<TossNotification> notifications;

  NotificationDialog(
    this.notifications, {
    super.key,
    super.animation = NavAni.Bottom,
    super.barrierDismissible = false,       // Dialog 바깥 영역 클릭시 닫히지 않게
  });

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...widget.notifications
              .map(
                (element) => NotificationItemWidget(
                  notification: element,
                  onTap: () {
                    widget.hide();
                    // Nav.pop(context);
                  },
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
