// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_electricity_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectricityResponse _$ElectricityResponseFromJson(Map<String, dynamic> json) =>
    ElectricityResponse(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ElectricityProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ElectricityResponseToJson(
        ElectricityResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

ElectricityProvider _$ElectricityProviderFromJson(Map<String, dynamic> json) =>
    ElectricityProvider(
      eId: (json['eId'] as num?)?.toInt(),
      electricityId: json['electricityId'] as String?,
      provider: json['provider'] as String?,
      abbreviation: json['abbreviation'] as String?,
      providerStatus: json['providerStatus'] as String?,
    );

Map<String, dynamic> _$ElectricityProviderToJson(
        ElectricityProvider instance) =>
    <String, dynamic>{
      'eId': instance.eId,
      'electricityId': instance.electricityId,
      'provider': instance.provider,
      'abbreviation': instance.abbreviation,
      'providerStatus': instance.providerStatus,
    };
