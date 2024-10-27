// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_transaction_pin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeTransactionPinResponse _$ChangeTransactionPinResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeTransactionPinResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$ChangeTransactionPinResponseToJson(
        ChangeTransactionPinResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
