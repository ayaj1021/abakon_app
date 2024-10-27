import 'package:json_annotation/json_annotation.dart';

part 'change_transaction_pin_response.g.dart';

@JsonSerializable()
class ChangeTransactionPinResponse {
  final bool? status;
  final String? msg;

  ChangeTransactionPinResponse({
    this.status,
    this.msg,
  });

  factory ChangeTransactionPinResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeTransactionPinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeTransactionPinResponseToJson(this);
}
