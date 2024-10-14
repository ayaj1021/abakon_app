// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyTokenResponse _$VerifyTokenResponseFromJson(Map<String, dynamic> json) =>
    VerifyTokenResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyTokenResponseToJson(
        VerifyTokenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userId: json['userId'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
    };
