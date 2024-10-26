// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_cable_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCableData _$GetAllCableDataFromJson(Map<String, dynamic> json) =>
    GetAllCableData(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CableData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCableDataToJson(GetAllCableData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

CableData _$CableDataFromJson(Map<String, dynamic> json) => CableData(
      cpId: (json['cpId'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: json['price'] as String?,
      userPrice: json['userPrice'] as String?,
      agentPrice: json['agentPrice'] as String?,
      vendorPrice: json['vendorPrice'] as String?,
      planId: json['planId'] as String?,
      type: json['type'] as String?,
      cableProvider: (json['cableProvider'] as num?)?.toInt(),
      day: json['day'] as String?,
      cId: (json['cId'] as num?)?.toInt(),
      cableId: json['cableId'] as String?,
      provider: json['provider'] as String?,
      providerStatus: json['providerStatus'] as String?,
    );

Map<String, dynamic> _$CableDataToJson(CableData instance) => <String, dynamic>{
      'cpId': instance.cpId,
      'name': instance.name,
      'price': instance.price,
      'userPrice': instance.userPrice,
      'agentPrice': instance.agentPrice,
      'vendorPrice': instance.vendorPrice,
      'planId': instance.planId,
      'type': instance.type,
      'cableProvider': instance.cableProvider,
      'day': instance.day,
      'cId': instance.cId,
      'cableId': instance.cableId,
      'provider': instance.provider,
      'providerStatus': instance.providerStatus,
    };
