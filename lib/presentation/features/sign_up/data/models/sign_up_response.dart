// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable(createToJson: false)
class SignUpResponse extends DSUser {
  const SignUpResponse({
    required super.status,
    required super.msg,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class DSUser extends Equatable {
  final bool status;

  final String msg;

  const DSUser({
    required this.status,
    required this.msg,
  });

  factory DSUser.fromJson(Map<String, dynamic> json) => _$DSUserFromJson(json);

  Map<String, dynamic> toJson() => _$DSUserToJson(this);

  @override
  List<Object> get props => [
        status,
        msg,
      ];
}
