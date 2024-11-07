import 'package:json_annotation/json_annotation.dart';

part 'referral_link_response.g.dart';

@JsonSerializable()
class ReferralResponse {
  final bool? status;
  final String? msg;
  final String? data;

  ReferralResponse({
    this.status,
    this.msg,
    this.data,
  });

  factory ReferralResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralResponseToJson(this);
}
