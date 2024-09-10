// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyTokenResponse _$VerifyTokenResponseFromJson(Map<String, dynamic> json) =>
    VerifyTokenResponse(
      id: json['id'] as String,
      message: json['message'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      status: json['status'] as bool,
    );

DSUser _$DSUserFromJson(Map<String, dynamic> json) => DSUser(
      message: json['message'] as String,
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$DSUserToJson(DSUser instance) => <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'token': instance.token,
      'status': instance.status,
    };
