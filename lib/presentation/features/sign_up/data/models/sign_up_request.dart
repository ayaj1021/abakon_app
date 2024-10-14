import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest extends Equatable {
  const SignUpRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
    required this.transpin,
    required this.state,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? password;
  final String? transpin;
  final String? state;

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);

  SignUpRequest copyWith({
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? password,
    String? transpin,
    String? state,
  }) {
    return SignUpRequest(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      transpin: transpin ?? this.transpin,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        email,
        phone,
        password,
        transpin,
        state,
      ];
}
