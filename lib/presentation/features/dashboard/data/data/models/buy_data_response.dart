import 'package:json_annotation/json_annotation.dart';

part 'buy_data_response.g.dart';

@JsonSerializable()
class BuyDataResponse {
  final bool? status;
  final String? msg;

  BuyDataResponse({
    this.status,
    this.msg,
  });

  factory BuyDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyDataResponseToJson(this);
}
