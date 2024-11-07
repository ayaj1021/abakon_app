import 'package:json_annotation/json_annotation.dart';

part 'logout_response.g.dart';

@JsonSerializable()
class LogoutResponse {
  final bool? status;
  final String? msg;

  LogoutResponse({this.status, this.msg});

  // Factory constructor to create a LogoutResponse from JSON
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  // Method to convert a LogoutResponse instance to JSON
  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
