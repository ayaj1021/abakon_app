// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_transactions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTransactionsResponse _$GetAllTransactionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllTransactionsResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AllTransactionsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllTransactionsResponseToJson(
        GetAllTransactionsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

AllTransactionsData _$AllTransactionsDataFromJson(Map<String, dynamic> json) =>
    AllTransactionsData(
      sFname: json['sFname'] as String?,
      sPhone: json['sPhone'] as String?,
      sEmail: json['sEmail'] as String?,
      sType: (json['sType'] as num?)?.toInt(),
      tId: (json['tId'] as num?)?.toInt(),
      sId: (json['sId'] as num?)?.toInt(),
      transref: json['transref'] as String?,
      servicename: json['servicename'] as String?,
      servicedesc: json['servicedesc'] as String?,
      amount: json['amount'] as String?,
      status: (json['status'] as num?)?.toInt(),
      oldbal: json['oldbal'] as String?,
      newbal: json['newbal'] as String?,
      profit: (json['profit'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$AllTransactionsDataToJson(
        AllTransactionsData instance) =>
    <String, dynamic>{
      'sFname': instance.sFname,
      'sPhone': instance.sPhone,
      'sEmail': instance.sEmail,
      'sType': instance.sType,
      'tId': instance.tId,
      'sId': instance.sId,
      'transref': instance.transref,
      'servicename': instance.servicename,
      'servicedesc': instance.servicedesc,
      'amount': instance.amount,
      'status': instance.status,
      'oldbal': instance.oldbal,
      'newbal': instance.newbal,
      'profit': instance.profit,
      'date': instance.date?.toIso8601String(),
    };
