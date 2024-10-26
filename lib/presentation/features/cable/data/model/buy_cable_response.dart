import 'package:json_annotation/json_annotation.dart';

part 'buy_cable_response.g.dart';

@JsonSerializable()
class BuyCableResponse {
  final String? status;
  final String? msg;

  BuyCableResponse({
    this.status,
    this.msg,
  });

  factory BuyCableResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyCableResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyCableResponseToJson(this);
}
