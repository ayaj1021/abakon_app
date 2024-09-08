import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_request.g.dart';

@JsonSerializable(createFactory: false)
class ResendOtpRequest implements EquatableMixin {
  const ResendOtpRequest({
    required this.email,
  });

  final String email;

  Map<String, dynamic> toJson() => _$ResendOtpRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object> get props => [email];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
