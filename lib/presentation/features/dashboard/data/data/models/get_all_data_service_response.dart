import 'package:json_annotation/json_annotation.dart';

part 'get_all_data_service_response.g.dart';

@JsonSerializable()
class DataResponse {
  bool? status;
  List<Plan>? data;

  DataResponse({this.status, this.data});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class Plan {
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

  Plan({
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

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
