import 'package:json_annotation/json_annotation.dart';

part 'delete_user_response.g.dart';

@JsonSerializable()
class DeleteUserResponse {
  final bool? status;
  final String? msg;

  DeleteUserResponse({
    this.status,
    this.msg,
  });

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserResponseToJson(this);
}
