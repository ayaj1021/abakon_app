// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      status: json['status'] as bool,
      msg: json['msg'] as String,
    );

DSUser _$DSUserFromJson(Map<String, dynamic> json) => DSUser(
      status: json['status'] as bool,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$DSUserToJson(DSUser instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
