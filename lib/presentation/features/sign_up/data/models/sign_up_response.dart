// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable(createToJson: false)
class SignUpResponse extends DSUser {
  const SignUpResponse({
    required super.success,
    required super.message,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class DSUser extends Equatable {
  final bool success;

  final String message;

  const DSUser({
    required this.success,
    required this.message,
  });

  factory DSUser.fromJson(Map<String, dynamic> json) => _$DSUserFromJson(json);

  Map<String, dynamic> toJson() => _$DSUserToJson(this);

  @override
  List<Object> get props => [
        success,
        message,
      ];
}
