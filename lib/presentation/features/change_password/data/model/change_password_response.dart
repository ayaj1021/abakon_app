import 'package:json_annotation/json_annotation.dart';
part 'change_password_response.g.dart';

@JsonSerializable()
class ChangePasswordResponse {
  final bool? status;
  final String? msg;

  ChangePasswordResponse({
    this.status,
    this.msg,
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}
