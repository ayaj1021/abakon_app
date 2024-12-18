// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_data_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      status: json['status'] as bool?,
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
      userprice: json['userprice'] as String?,
      agentprice: json['agentprice'] as String?,
      vendorprice: json['vendorprice'] as String?,
      planid: json['planid'] as String?,
      type: json['type'] as String?,
      datanetwork: (json['datanetwork'] as num?)?.toInt(),
      day: json['day'] as String?,
      nId: (json['nId'] as num?)?.toInt(),
      networkid: json['networkid'] as String?,
      smeId: json['smeId'] as String?,
      smeId2: json['smeId2'] as String?,
      giftingId: json['giftingId'] as String?,
      corporateId: json['corporateId'] as String?,
      vtuId: json['vtuId'] as String?,
      sharesellId: json['sharesellId'] as String?,
      network: json['network'] as String?,
      networkStatus: json['networkStatus'] as String?,
      vtuStatus: json['vtuStatus'] as String?,
      sharesellStatus: json['sharesellStatus'] as String?,
      airtimepinStatus: json['airtimepinStatus'] as String?,
      smeStatus: json['smeStatus'] as String?,
      sme2Status: json['sme2Status'] as String?,
      giftingStatus: json['giftingStatus'] as String?,
      corporateStatus: json['corporateStatus'] as String?,
      datapinStatus: json['datapinStatus'] as String?,
      momoStatus: json['momoStatus'] as String?,
      manualOrderStatus: json['manualOrderStatus'] as String?,
      couponid: json['couponid'] as String?,
      couponStatus: json['couponStatus'] as String?,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'pId': instance.pId,
      'name': instance.name,
      'price': instance.price,
      'userprice': instance.userprice,
      'agentprice': instance.agentprice,
      'vendorprice': instance.vendorprice,
      'planid': instance.planid,
      'type': instance.type,
      'datanetwork': instance.datanetwork,
      'day': instance.day,
      'nId': instance.nId,
      'networkid': instance.networkid,
      'smeId': instance.smeId,
      'smeId2': instance.smeId2,
      'giftingId': instance.giftingId,
      'corporateId': instance.corporateId,
      'vtuId': instance.vtuId,
      'sharesellId': instance.sharesellId,
      'network': instance.network,
      'networkStatus': instance.networkStatus,
      'vtuStatus': instance.vtuStatus,
      'sharesellStatus': instance.sharesellStatus,
      'airtimepinStatus': instance.airtimepinStatus,
      'smeStatus': instance.smeStatus,
      'sme2Status': instance.sme2Status,
      'giftingStatus': instance.giftingStatus,
      'corporateStatus': instance.corporateStatus,
      'datapinStatus': instance.datapinStatus,
      'momoStatus': instance.momoStatus,
      'manualOrderStatus': instance.manualOrderStatus,
      'couponid': instance.couponid,
      'couponStatus': instance.couponStatus,
    };
