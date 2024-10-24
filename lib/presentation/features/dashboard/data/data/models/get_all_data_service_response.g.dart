// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_data_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      pId: (json['pId'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: json['price'] as String?,
      userPrice: json['userPrice'] as String?,
      agentPrice: json['agentPrice'] as String?,
      vendorPrice: json['vendorPrice'] as String?,
      planId: json['planId'] as String?,
      type: json['type'] as String?,
      dataNetwork: (json['dataNetwork'] as num?)?.toInt(),
      day: json['day'] as String?,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'pId': instance.pId,
      'name': instance.name,
      'price': instance.price,
      'userPrice': instance.userPrice,
      'agentPrice': instance.agentPrice,
      'vendorPrice': instance.vendorPrice,
      'planId': instance.planId,
      'type': instance.type,
      'dataNetwork': instance.dataNetwork,
      'day': instance.day,
    };
