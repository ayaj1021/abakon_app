// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) =>
    DeleteUserResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$DeleteUserResponseToJson(DeleteUserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
