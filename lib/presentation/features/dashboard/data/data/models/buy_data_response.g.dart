// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyDataResponse _$BuyDataResponseFromJson(Map<String, dynamic> json) =>
    BuyDataResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$BuyDataResponseToJson(BuyDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
