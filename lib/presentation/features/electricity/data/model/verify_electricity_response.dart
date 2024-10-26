import 'package:json_annotation/json_annotation.dart';

part 'verify_electricity_response.g.dart';

@JsonSerializable()
class VerifyElectricityResponse {
  final bool? status;
  final String? msg;

  VerifyElectricityResponse({
    this.status,
    this.msg,
  });

  factory VerifyElectricityResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyElectricityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyElectricityResponseToJson(this);
}
