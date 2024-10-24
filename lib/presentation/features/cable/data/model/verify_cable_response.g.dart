// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_cable_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCableResponse _$VerifyCableResponseFromJson(Map<String, dynamic> json) =>
    VerifyCableResponse(
      verifyCableResponseStatus: json['verifyCableResponseStatus'] as String?,
      status: json['status'] as String?,
      msg: json['msg'] as String?,
      name: json['name'] as String?,
      customerName: json['customerName'] as String?,
    );

Map<String, dynamic> _$VerifyCableResponseToJson(
        VerifyCableResponse instance) =>
    <String, dynamic>{
      'verifyCableResponseStatus': instance.verifyCableResponseStatus,
      'status': instance.status,
      'msg': instance.msg,
      'name': instance.name,
      'customerName': instance.customerName,
    };
