// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_cable_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCableResponse _$VerifyCableResponseFromJson(Map<String, dynamic> json) =>
    VerifyCableResponse(
      status: json['status'] as bool?,
      verifyCableResponseStatus: json['verifyCableResponseStatus'] as String?,
      msg: json['msg'] as String?,
      name: json['name'] as String?,
      customerName: json['customerName'] as String?,
    );

Map<String, dynamic> _$VerifyCableResponseToJson(
        VerifyCableResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'verifyCableResponseStatus': instance.verifyCableResponseStatus,
      'msg': instance.msg,
      'name': instance.name,
      'customerName': instance.customerName,
    };
