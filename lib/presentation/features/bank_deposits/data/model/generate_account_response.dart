import 'package:json_annotation/json_annotation.dart';
part 'generate_account_response.g.dart';
@JsonSerializable()
class GenerateAccountResponse {
  final bool? status;
  final String? message;
  final Data? data;

  GenerateAccountResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GenerateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateAccountResponseToJson(this);
}

@JsonSerializable()
class Data {
  final bool? status;
  final String? service;
  final String? business;
  final List<Bank>? banks;

  Data({
    this.status,
    this.service,
    this.business,
    this.banks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Bank {
  final String? bankCode;
  final String? bankName;
  final String? accountNumber;
  final String? accountName;
  final String? accountType;
  final String? expireDate;
  final String? trackingReference;

  Bank({
    this.bankCode,
    this.bankName,
    this.accountNumber,
    this.accountName,
    this.accountType,
    this.expireDate,
    this.trackingReference,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);
}
