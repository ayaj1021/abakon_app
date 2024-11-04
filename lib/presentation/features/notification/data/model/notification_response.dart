import 'package:json_annotation/json_annotation.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  final bool? status;
  final String? msg;
  final List<NotificationData>? data;

  NotificationResponse({
    this.status,
    this.msg,
    this.data,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}

@JsonSerializable()
class NotificationData {
  final int? msgId;
  final int? msgfor;
  final String? subject;
  final String? message;
  final int? status;
  final String? dPosted;

  NotificationData({
    this.msgId,
    this.msgfor,
    this.subject,
    this.message,
    this.status,
    this.dPosted,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
