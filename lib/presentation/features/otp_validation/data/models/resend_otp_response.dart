import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_response.g.dart';

@JsonSerializable()
class ResendOtpResponse {
  final bool? status;
  final String? msg;

  ResendOtpResponse({
    this.status,
    this.msg,
  });

  // Factory constructor for creating a new instance from a map (JSON)
  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpResponseFromJson(json);

  // Method for converting an instance to a map (JSON)
  Map<String, dynamic> toJson() => _$ResendOtpResponseToJson(this);
}
