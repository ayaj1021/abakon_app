//Generate data class using jsonserializable
// {
//     "email": "gbenga@yopmail.com",
//     "otp": 482129

// }

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request.g.dart';

@JsonSerializable(createFactory: false)
class VerifyOtpRequest implements EquatableMixin {
  const VerifyOtpRequest({
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;

  Map<String, dynamic> toJson() => _$VerifyOtpRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object> get props => [email, otp];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
