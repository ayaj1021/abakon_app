import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';


@JsonSerializable()
class LoginResponse {
  final bool? status;
  final String? msg;
  final String? token;
  final String? accessToken;
  final User? user;

  LoginResponse({
    this.status,
    this.msg,
    this.token,
    this.accessToken,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}



@JsonSerializable()
class User {
  final String? sId;
  final String? sFname;
  final String? sLname;
  final String? sEmail;

  @JsonKey(defaultValue: "")
  final String? sPhone;
  final String? sState;
  final num? sType;
  final num? sRegStatus;

  User({
    this.sId,
    this.sFname,
    this.sLname,
    this.sEmail,
    this.sPhone,
    this.sState,
    this.sType,
    this.sRegStatus,
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
