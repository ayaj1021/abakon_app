import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest extends Equatable {
  const SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.transactionPin,
    required this.state,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? password;
  final String? transactionPin;
  final String? state;

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);

  SignUpRequest copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? password,
    String? transactionPin,
    String? state,
  }) {
    return SignUpRequest(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      transactionPin: transactionPin ?? this.transactionPin,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phone,
        password,
        transactionPin,
        state,
      ];
}
