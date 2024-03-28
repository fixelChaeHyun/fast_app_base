import 'notification_type.dart';

class TossNotification {
  // 이미지, 타이틀, 설명, 시간 + 알림 타입
  final NotificationType type;
  final String description;
  final DateTime time;
  bool isRead;

  TossNotification(
    this.type,
    this.description,
    this.time, {
    this.isRead = false,
  });
}
