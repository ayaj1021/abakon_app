import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

// {
//         "tokens": {
//             "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlMzhmZDMzNC04M2FlLTQ3ZTctODIxZS1hNzc4ZmNmOWVjMmEiLCJlbWFpbCI6InRlc3Q1QGVtYWlsLmNvbSIsImZpcnN0TmFtZSI6ImZpcnN0bmFtZSIsImxhc3ROYW1lIjoibGFzdG5hbWUiLCJpYXQiOjE3MTg1NzMzMTgsImV4cCI6MTcxODU3MzMxOH0.L7hCpggfnYPBeJ6JcSxPf87ctYSFcLcatlT94eNy3MY",
//             "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlMzhmZDMzNC04M2FlLTQ3ZTctODIxZS1hNzc4ZmNmOWVjMmEiLCJlbWFpbCI6InRlc3Q1QGVtYWlsLmNvbSIsImZpcnN0TmFtZSI6ImZpcnN0bmFtZSIsImxhc3ROYW1lIjoibGFzdG5hbWUiLCJpYXQiOjE3MTg1NzMzMTgsImV4cCI6MTcxODU3MzMxOH0.Dmkbuq6WoLddSWKhZbH6JK0jU6geZ570tWhPHL3seyo"
//         },
//         "email": "test5@email.com",
//         "first_name": "firstname",
//         "last_name": "lastname"
//     }

abstract class AuthResponse extends Equatable {
  const AuthResponse({
    required this.tokens,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.id,
  });

  AuthResponse.fromJson(Map<String, dynamic> json)
      : tokens = Tokens.fromJson(json['tokens'] as Map<String, dynamic>? ?? {}),
        email = json['email'] as String? ?? '',
        firstName = json['first_name'] as String? ?? '',
        lastName = json['last_name'] as String? ?? '',
        phoneNumber = json['phone_number'] as String? ?? '',
        id = json['id'] as String? ?? '';

  final Tokens? tokens;
  final String? email;

  final String? firstName;

  final String? lastName;
  final String? phoneNumber;
  final String? id;

  @override
  List<Object?> get props => [
        tokens,
        email,
        firstName,
        lastName,
      ];
}

@JsonSerializable()
class Tokens extends Equatable {
  const Tokens({
    required this.token,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  @JsonKey(name: 'token')
  final String? token;

  Map<String, dynamic> toJson() => _$TokensToJson(this);

  @override
  List<Object?> get props => [
        token,
      ];
}
