// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_electricity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyElectricityResponse _$VerifyElectricityResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyElectricityResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$VerifyElectricityResponseToJson(
        VerifyElectricityResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
