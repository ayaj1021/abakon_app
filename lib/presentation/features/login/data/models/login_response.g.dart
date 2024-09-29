// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      token: json['token'] as String?,
      accessToken: json['accessToken'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'token': instance.token,
      'accessToken': instance.accessToken,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      sId: json['sId'] as String?,
      sFname: json['sFname'] as String?,
      sLname: json['sLname'] as String?,
      sEmail: json['sEmail'] as String?,
      sPhone: json['sPhone'] as String? ?? '',
      sState: json['sState'] as String?,
      sType: json['sType'] as num?,
      sRegStatus: json['sRegStatus'] as num?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'sId': instance.sId,
      'sFname': instance.sFname,
      'sLname': instance.sLname,
      'sEmail': instance.sEmail,
      'sPhone': instance.sPhone,
      'sState': instance.sState,
      'sType': instance.sType,
      'sRegStatus': instance.sRegStatus,
    };
