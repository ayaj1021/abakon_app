// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      msgId: (json['msgId'] as num?)?.toInt(),
      msgfor: (json['msgfor'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      message: json['message'] as String?,
      status: (json['status'] as num?)?.toInt(),
      dPosted: json['dPosted'] as String?,
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'msgId': instance.msgId,
      'msgfor': instance.msgfor,
      'subject': instance.subject,
      'message': instance.message,
      'status': instance.status,
      'dPosted': instance.dPosted,
    };
