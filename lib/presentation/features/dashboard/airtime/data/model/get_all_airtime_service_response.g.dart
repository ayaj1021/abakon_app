// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_airtime_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirtimeResponse _$AirtimeResponseFromJson(Map<String, dynamic> json) =>
    AirtimeResponse(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AirtimeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirtimeResponseToJson(AirtimeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

AirtimeData _$AirtimeDataFromJson(Map<String, dynamic> json) => AirtimeData(
      aId: (json['aId'] as num?)?.toInt(),
      aNetwork: json['aNetwork'] as String?,
      aBuyDiscount: (json['aBuyDiscount'] as num?)?.toInt(),
      aUserDiscount: (json['aUserDiscount'] as num?)?.toInt(),
      aAgentDiscount: (json['aAgentDiscount'] as num?)?.toInt(),
      aVendorDiscount: (json['aVendorDiscount'] as num?)?.toInt(),
      aType: json['aType'] as String?,
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

Map<String, dynamic> _$AirtimeDataToJson(AirtimeData instance) =>
    <String, dynamic>{
      'aId': instance.aId,
      'aNetwork': instance.aNetwork,
      'aBuyDiscount': instance.aBuyDiscount,
      'aUserDiscount': instance.aUserDiscount,
      'aAgentDiscount': instance.aAgentDiscount,
      'aVendorDiscount': instance.aVendorDiscount,
      'aType': instance.aType,
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
