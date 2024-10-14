import 'package:json_annotation/json_annotation.dart';

part 'buy_airtime_response.g.dart';

@JsonSerializable()
class BuyAirtimeResponse {
  final bool? status;
  final String? msg;

  BuyAirtimeResponse({
    this.status,
    this.msg,
  });

  factory BuyAirtimeResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyAirtimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyAirtimeResponseToJson(this);
}
