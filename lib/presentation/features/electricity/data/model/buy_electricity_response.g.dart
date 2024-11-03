// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_electricity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyElectricityResponse _$BuyElectricityResponseFromJson(
        Map<String, dynamic> json) =>
    BuyElectricityResponse(
      status: json['status'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$BuyElectricityResponseToJson(
        BuyElectricityResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
