import 'package:json_annotation/json_annotation.dart';
part 'get_all_services_response.g.dart';

@JsonSerializable()
class GetAllServicesResponse {
  bool? status;
  String? message;
  Data? data;

  GetAllServicesResponse({this.status, this.message, this.data});

  factory GetAllServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllServicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllServicesResponseToJson(this);
}

@JsonSerializable()
class Data {
  List<ApiConfig>? apiConfig;
  List<DataPlan>? dataPlans;
  List<CablePlan>? cablePlans;
  List<AirtimeDiscount>? airtimeDiscount;
  List<dynamic>? alphaTopupPlans;
  dynamic smileDataPlans;
  SiteSettings? siteSettings;
  SiteConfiguration? siteConfiguration;

  Data({
    this.apiConfig,
    this.dataPlans,
    this.cablePlans,
    this.airtimeDiscount,
    this.alphaTopupPlans,
    this.smileDataPlans,
    this.siteSettings,
    this.siteConfiguration,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ApiConfig {
  int? aId;
  String? name;
  String? value;

  ApiConfig({this.aId, this.name, this.value});

  factory ApiConfig.fromJson(Map<String, dynamic> json) =>
      _$ApiConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ApiConfigToJson(this);
}

@JsonSerializable()
class DataPlan {
  int? pId;
  String? name;
  String? price;
  String? userprice;
  String? agentprice;
  String? vendorprice;
  String? planid;
  String? type;
  int? datanetwork;
  String? day;
  int? nId;
  String? networkid;
  String? smeId;
  String? smeId2;
  String? giftingId;
  String? corporateId;
  String? vtuId;
  String? sharesellId;
  String? network;
  String? networkStatus;
  String? vtuStatus;
  String? sharesellStatus;
  String? airtimepinStatus;
  String? smeStatus;
  String? sme2Status;
  String? giftingStatus;
  String? corporateStatus;
  String? datapinStatus;
  String? momoStatus;
  String? manualOrderStatus;
  String? couponid;
  String? couponStatus;

  DataPlan({
    this.pId,
    this.name,
    this.price,
    this.userprice,
    this.agentprice,
    this.vendorprice,
    this.planid,
    this.type,
    this.datanetwork,
    this.day,
    this.nId,
    this.networkid,
    this.smeId,
    this.smeId2,
    this.giftingId,
    this.corporateId,
    this.vtuId,
    this.sharesellId,
    this.network,
    this.networkStatus,
    this.vtuStatus,
    this.sharesellStatus,
    this.airtimepinStatus,
    this.smeStatus,
    this.sme2Status,
    this.giftingStatus,
    this.corporateStatus,
    this.datapinStatus,
    this.momoStatus,
    this.manualOrderStatus,
    this.couponid,
    this.couponStatus,
  });

  factory DataPlan.fromJson(Map<String, dynamic> json) =>
      _$DataPlanFromJson(json);

  Map<String, dynamic> toJson() => _$DataPlanToJson(this);
}

@JsonSerializable()
class CablePlan {
  int? cpId;
  String? name;
  String? price;
  String? userprice;
  String? agentprice;
  String? vendorprice;
  String? planid;
  String? type;
  int? cableprovider;
  String? day;
  int? cId;
  String? cableid;
  String? provider;
  String? providerStatus;

  CablePlan({
    this.cpId,
    this.name,
    this.price,
    this.userprice,
    this.agentprice,
    this.vendorprice,
    this.planid,
    this.type,
    this.cableprovider,
    this.day,
    this.cId,
    this.cableid,
    this.provider,
    this.providerStatus,
  });

  factory CablePlan.fromJson(Map<String, dynamic> json) =>
      _$CablePlanFromJson(json);

  Map<String, dynamic> toJson() => _$CablePlanToJson(this);
}

@JsonSerializable()
class AirtimeDiscount {
  int? aId;
  String? aNetwork;
  int? aBuyDiscount;
  int? aUserDiscount;
  int? aAgentDiscount;
  int? aVendorDiscount;
  String? aType;
  int? nId;
  String? networkid;
  String? smeId;
  String? smeId2;
  String? giftingId;
  String? corporateId;
  String? vtuId;
  String? sharesellId;
  String? network;
  String? networkStatus;
  String? vtuStatus;
  String? sharesellStatus;
  String? airtimepinStatus;
  String? smeStatus;
  String? sme2Status;
  String? giftingStatus;
  String? corporateStatus;
  String? datapinStatus;
  String? momoStatus;
  String? manualOrderStatus;
  String? couponid;
  String? couponStatus;

  AirtimeDiscount({
    this.aId,
    this.aNetwork,
    this.aBuyDiscount,
    this.aUserDiscount,
    this.aAgentDiscount,
    this.aVendorDiscount,
    this.aType,
    this.nId,
    this.networkid,
    this.smeId,
    this.smeId2,
    this.giftingId,
    this.corporateId,
    this.vtuId,
    this.sharesellId,
    this.network,
    this.networkStatus,
    this.vtuStatus,
    this.sharesellStatus,
    this.airtimepinStatus,
    this.smeStatus,
    this.sme2Status,
    this.giftingStatus,
    this.corporateStatus,
    this.datapinStatus,
    this.momoStatus,
    this.manualOrderStatus,
    this.couponid,
    this.couponStatus,
  });

  factory AirtimeDiscount.fromJson(Map<String, dynamic> json) =>
      _$AirtimeDiscountFromJson(json);

  Map<String, dynamic> toJson() => _$AirtimeDiscountToJson(this);
}

@JsonSerializable()
class SiteSettings {
  String? name;
  String? description;
  String? email;
  String? phone;
  String? logo;
  String? address;

  SiteSettings(
      {this.name,
      this.description,
      this.email,
      this.phone,
      this.logo,
      this.address});

  factory SiteSettings.fromJson(Map<String, dynamic> json) =>
      _$SiteSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SiteSettingsToJson(this);
}

@JsonSerializable()
class SiteConfiguration {
  int? maxRequestTimeout;
  bool? enableLiveChat;
  String? supportEmail;

  SiteConfiguration(
      {this.maxRequestTimeout, this.enableLiveChat, this.supportEmail});

  factory SiteConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SiteConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SiteConfigurationToJson(this);
}
