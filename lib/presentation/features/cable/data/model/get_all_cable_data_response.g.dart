// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_cable_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCableData _$GetAllCableDataFromJson(Map<String, dynamic> json) =>
    GetAllCableData(
      status: json['status'] as String?,
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
      userprice: json['userprice'] as String?,
      agentprice: json['agentprice'] as String?,
      vendorprice: json['vendorprice'] as String?,
      planid: json['planid'] as String?,
      type: json['type'],
      cableprovider: (json['cableprovider'] as num?)?.toInt(),
      day: json['day'] as String?,
    );

Map<String, dynamic> _$CableDataToJson(CableData instance) => <String, dynamic>{
      'cpId': instance.cpId,
      'name': instance.name,
      'price': instance.price,
      'userprice': instance.userprice,
      'agentprice': instance.agentprice,
      'vendorprice': instance.vendorprice,
      'planid': instance.planid,
      'type': instance.type,
      'cableprovider': instance.cableprovider,
      'day': instance.day,
    };
