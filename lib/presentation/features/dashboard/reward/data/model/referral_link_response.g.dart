// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralResponse _$ReferralResponseFromJson(Map<String, dynamic> json) =>
    ReferralResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$ReferralResponseToJson(ReferralResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
