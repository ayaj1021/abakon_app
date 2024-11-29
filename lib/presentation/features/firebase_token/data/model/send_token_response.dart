import 'package:json_annotation/json_annotation.dart';

part 'send_token_response.g.dart';

@JsonSerializable()
class SendTokenResponse {
  final bool status;
  final String msg;

  SendTokenResponse({
    required this.status,
    required this.msg,
  });

  factory SendTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$SendTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendTokenResponseToJson(this);
}
