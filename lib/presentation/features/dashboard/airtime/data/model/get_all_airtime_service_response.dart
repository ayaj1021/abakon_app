import 'package:json_annotation/json_annotation.dart';

part 'get_all_airtime_service_response.g.dart';

@JsonSerializable()
class AirtimeResponse {
  final bool? status;
  final List<AirtimeData>? data;

  AirtimeResponse({this.status, this.data});

  factory AirtimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AirtimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AirtimeResponseToJson(this);
}


@JsonSerializable()
class AirtimeData {
  final int? aId;
  final String? aNetwork;
  final int? aBuyDiscount;
  final int? aUserDiscount;
  final int? aAgentDiscount;
  final int? aVendorDiscount;
  final String? aType;
  final int? nId;
  final String? networkid;
  final String? smeId;
  final String? smeId2;
  final String? giftingId;
  final String? corporateId;
  final String? vtuId;
  final String? sharesellId;
  final String? network;
  final String? networkStatus;
  final String? vtuStatus;
  final String? sharesellStatus;
  final String? airtimepinStatus;
  final String? smeStatus;
  final String? sme2Status;
  final String? giftingStatus;
  final String? corporateStatus;
  final String? datapinStatus;
  final String? momoStatus;
  final String? manualOrderStatus;
  final String? couponid;
  final String? couponStatus;

  AirtimeData({
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

  factory AirtimeData.fromJson(Map<String, dynamic> json) =>_$AirtimeDataFromJson(json);

  Map<String, dynamic> toJson() => _$AirtimeDataToJson(this);
}
