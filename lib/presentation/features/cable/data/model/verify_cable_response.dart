import 'package:json_annotation/json_annotation.dart';

part 'verify_cable_response.g.dart';

@JsonSerializable()
class VerifyCableResponse {
  final bool? status;
  final String? verifyCableResponseStatus;
  final String? msg;
  final String? name;
  final String? customerName;

  VerifyCableResponse({
    this.status,
    this.verifyCableResponseStatus,
    this.msg,
    this.name,
    this.customerName,
  });

  factory VerifyCableResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCableResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCableResponseToJson(this);
}
