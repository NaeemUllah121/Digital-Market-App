import 'package:hive/hive.dart';

part 'notification_model.g.dart';

@HiveType(typeId: 0)
class NotificationModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? message;
  @HiveField(3)
  final DateTime? createdAt;
  @HiveField(4)
  String? notificationType;

  NotificationModel(
      {required this.id, required this.title, required this.message,required this.createdAt,required this.notificationType});
}
