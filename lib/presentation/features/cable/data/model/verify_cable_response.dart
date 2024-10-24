import 'package:json_annotation/json_annotation.dart';

part 'verify_cable_response.g.dart';

@JsonSerializable()
class VerifyCableResponse {
  final String? verifyCableResponseStatus;
  final String? status;
  final String? msg;
  final String? name;
  final String? customerName;

  VerifyCableResponse({
    this.verifyCableResponseStatus,
    this.status,
    this.msg,
    this.name,
    this.customerName,
  });

  factory VerifyCableResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCableResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCableResponseToJson(this);
}
