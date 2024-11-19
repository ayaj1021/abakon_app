import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable(createFactory: false)
class ResetPasswordRequest implements EquatableMixin {
  const ResetPasswordRequest({
    required this.password,
    required this.email,
    required this.otp,
  });

  final String password;

  final String email;

  final String otp;

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [password, email, otp];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
