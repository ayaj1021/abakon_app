import 'package:abakon/domain/models/auth_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends AuthResponse {
  const LoginResponse({
    super.tokens,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.id,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
