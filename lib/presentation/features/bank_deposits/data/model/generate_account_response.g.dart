// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateAccountResponse _$GenerateAccountResponseFromJson(
        Map<String, dynamic> json) =>
    GenerateAccountResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerateAccountResponseToJson(
        GenerateAccountResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      status: json['status'] as bool?,
      service: json['service'] as String?,
      business: json['business'] as String?,
      banks: (json['banks'] as List<dynamic>?)
          ?.map((e) => Bank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'status': instance.status,
      'service': instance.service,
      'business': instance.business,
      'banks': instance.banks,
    };

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      bankCode: json['bankCode'] as String?,
      bankName: json['bankName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountName: json['accountName'] as String?,
      accountType: json['accountType'] as String?,
      expireDate: json['expireDate'] as String?,
      trackingReference: json['trackingReference'] as String?,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'bankCode': instance.bankCode,
      'bankName': instance.bankName,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'accountType': instance.accountType,
      'expireDate': instance.expireDate,
      'trackingReference': instance.trackingReference,
    };
