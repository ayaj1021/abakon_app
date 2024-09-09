// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

DSUser _$DSUserFromJson(Map<String, dynamic> json) => DSUser(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$DSUserToJson(DSUser instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
