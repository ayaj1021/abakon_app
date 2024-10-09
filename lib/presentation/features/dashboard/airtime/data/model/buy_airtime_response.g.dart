// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_airtime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyAirtimeResponse _$BuyAirtimeResponseFromJson(Map<String, dynamic> json) =>
    BuyAirtimeResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$BuyAirtimeResponseToJson(BuyAirtimeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
