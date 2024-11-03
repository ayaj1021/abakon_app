import 'package:json_annotation/json_annotation.dart';

part 'buy_electricity_response.g.dart';

@JsonSerializable()
class BuyElectricityResponse {
  final String? status;
  final String? msg;

  BuyElectricityResponse({this.status, this.msg});

  factory BuyElectricityResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyElectricityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyElectricityResponseToJson(this);
}
