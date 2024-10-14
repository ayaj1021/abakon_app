// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'verify_token_response.g.dart';

// @JsonSerializable(createToJson: false)
// class VerifyTokenResponse extends DSUser {
//   const VerifyTokenResponse({
//     required super.msg,
//     // required super.userId,
//     // required super.token,
//     required super.status,
//   });

//   factory VerifyTokenResponse.fromJson(Map<String, dynamic> json) =>
//       _$VerifyTokenResponseFromJson(json);
// }

// @JsonSerializable()
// class DSUser extends Equatable {
//   final String msg;
//  // @JsonKey(defaultValue: "user_id")
//   // final String userId;

//   // final String token;
//   final bool status;

//   const DSUser({
//     required this.msg,
//     // required this.userId,
//     // required this.token,
//     required this.status,
//   });

//   factory DSUser.fromJson(Map<String, dynamic> json) => _$DSUserFromJson(json);

//   Map<String, dynamic> toJson() => _$DSUserToJson(this);

//   @override
//   List<Object> get props => [
//         msg,
//         // userId,
//         // token,
//         status,
//       ];
// }



@JsonSerializable()
class VerifyTokenResponse {
    final bool? status;
    final String? msg;
    final Data? data;

    VerifyTokenResponse({
        this.status,
        this.msg,
        this.data,
    });

    factory VerifyTokenResponse.fromJson(Map<String, dynamic> json) => _$VerifyTokenResponseFromJson(json);

    Map<String, dynamic> toJson() => _$VerifyTokenResponseToJson(this);
}



@JsonSerializable()
class Data {
    final String? userId;
    final String? token;

    Data({
        this.userId,
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}



//ayaj1021+i@gmail.com, phone: 09123456786