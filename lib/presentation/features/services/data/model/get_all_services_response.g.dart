// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_services_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllServicesResponse _$GetAllServicesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllServicesResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllServicesResponseToJson(
        GetAllServicesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      apiConfig: (json['apiConfig'] as List<dynamic>?)
          ?.map((e) => ApiConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataPlans: (json['dataPlans'] as List<dynamic>?)
          ?.map((e) => DataPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      cablePlans: (json['cablePlans'] as List<dynamic>?)
          ?.map((e) => CablePlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      airtimeDiscount: (json['airtimeDiscount'] as List<dynamic>?)
          ?.map((e) => AirtimeDiscount.fromJson(e as Map<String, dynamic>))
          .toList(),
      alphaTopupPlans: json['alphaTopupPlans'] as List<dynamic>?,
      smileDataPlans: json['smileDataPlans'],
      siteSettings: json['siteSettings'] == null
          ? null
          : SiteSettings.fromJson(json['siteSettings'] as Map<String, dynamic>),
      siteConfiguration: json['siteConfiguration'] == null
          ? null
          : SiteConfiguration.fromJson(
              json['siteConfiguration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'apiConfig': instance.apiConfig,
      'dataPlans': instance.dataPlans,
      'cablePlans': instance.cablePlans,
      'airtimeDiscount': instance.airtimeDiscount,
      'alphaTopupPlans': instance.alphaTopupPlans,
      'smileDataPlans': instance.smileDataPlans,
      'siteSettings': instance.siteSettings,
      'siteConfiguration': instance.siteConfiguration,
    };

ApiConfig _$ApiConfigFromJson(Map<String, dynamic> json) => ApiConfig(
      aId: (json['aId'] as num?)?.toInt(),
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ApiConfigToJson(ApiConfig instance) => <String, dynamic>{
      'aId': instance.aId,
      'name': instance.name,
      'value': instance.value,
    };

DataPlan _$DataPlanFromJson(Map<String, dynamic> json) => DataPlan(
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

Map<String, dynamic> _$DataPlanToJson(DataPlan instance) => <String, dynamic>{
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

CablePlan _$CablePlanFromJson(Map<String, dynamic> json) => CablePlan(
      cpId: (json['cpId'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: json['price'] as String?,
      userprice: json['userprice'] as String?,
      agentprice: json['agentprice'] as String?,
      vendorprice: json['vendorprice'] as String?,
      planid: json['planid'] as String?,
      type: json['type'] as String?,
      cableprovider: (json['cableprovider'] as num?)?.toInt(),
      day: json['day'] as String?,
      cId: (json['cId'] as num?)?.toInt(),
      cableid: json['cableid'] as String?,
      provider: json['provider'] as String?,
      providerStatus: json['providerStatus'] as String?,
    );

Map<String, dynamic> _$CablePlanToJson(CablePlan instance) => <String, dynamic>{
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
      'cId': instance.cId,
      'cableid': instance.cableid,
      'provider': instance.provider,
      'providerStatus': instance.providerStatus,
    };

AirtimeDiscount _$AirtimeDiscountFromJson(Map<String, dynamic> json) =>
    AirtimeDiscount(
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

Map<String, dynamic> _$AirtimeDiscountToJson(AirtimeDiscount instance) =>
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

SiteSettings _$SiteSettingsFromJson(Map<String, dynamic> json) => SiteSettings(
      name: json['name'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      logo: json['logo'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$SiteSettingsToJson(SiteSettings instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'email': instance.email,
      'phone': instance.phone,
      'logo': instance.logo,
      'address': instance.address,
    };

SiteConfiguration _$SiteConfigurationFromJson(Map<String, dynamic> json) =>
    SiteConfiguration(
      maxRequestTimeout: (json['maxRequestTimeout'] as num?)?.toInt(),
      enableLiveChat: json['enableLiveChat'] as bool?,
      supportEmail: json['supportEmail'] as String?,
    );

Map<String, dynamic> _$SiteConfigurationToJson(SiteConfiguration instance) =>
    <String, dynamic>{
      'maxRequestTimeout': instance.maxRequestTimeout,
      'enableLiveChat': instance.enableLiveChat,
      'supportEmail': instance.supportEmail,
    };
