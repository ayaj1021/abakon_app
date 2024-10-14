import 'package:json_annotation/json_annotation.dart';


part 'get_all_transactions_response.g.dart';
@JsonSerializable()
class GetAllTransactionsResponse {
  final bool? status;
  final String? message;
  final List<AllTransactionsData>? data;

  GetAllTransactionsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetAllTransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllTransactionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllTransactionsResponseToJson(this);
}

@JsonSerializable()
class AllTransactionsData {
  final String? sFname;
  final String? sPhone;
  final String? sEmail;
  final int? sType;
  final int? tId;
  final int? sId;
  final String? transref;
  final String? servicename;
  final String? servicedesc;
  final String? amount;
  final int? status;
  final String? oldbal;
  final String? newbal;
  final int? profit;
  final DateTime? date;

  AllTransactionsData({
    this.sFname,
    this.sPhone,
    this.sEmail,
    this.sType,
    this.tId,
    this.sId,
    this.transref,
    this.servicename,
    this.servicedesc,
    this.amount,
    this.status,
    this.oldbal,
    this.newbal,
    this.profit,
    this.date,
  });

  factory AllTransactionsData.fromJson(Map<String, dynamic> json) =>
      _$AllTransactionsDataFromJson(json);

  Map<String, dynamic> toJson() => _$AllTransactionsDataToJson(this);
}
