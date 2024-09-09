// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_token_response.g.dart';

@JsonSerializable(createToJson: false)
class VerifyTokenResponse extends DSUser {
  const VerifyTokenResponse({
    required super.id,
    required super.message,
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.email,
    required super.token,
  });

  factory VerifyTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyTokenResponseFromJson(json);
}

@JsonSerializable()
class DSUser extends Equatable {
 

  final String message;
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String token;

  const DSUser({
    required this.message,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.token,
  });

  factory DSUser.fromJson(Map<String, dynamic> json) => _$DSUserFromJson(json);

  Map<String, dynamic> toJson() => _$DSUserToJson(this);

  @override
  List<Object> get props => [
        message,
        id,
        firstName,
        lastName,
        phone,
        email,
        token,
      ];
}
