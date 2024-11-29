// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendTokenResponse _$SendTokenResponseFromJson(Map<String, dynamic> json) =>
    SendTokenResponse(
      status: json['status'] as bool,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$SendTokenResponseToJson(SendTokenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
