import 'package:json_annotation/json_annotation.dart';

part 'get_all_cable_data_response.g.dart';

@JsonSerializable()
class GetAllCableData {
  final String? status;
  final List<CableData>? data;

  GetAllCableData({
    this.status,
    this.data,
  });

  factory GetAllCableData.fromJson(Map<String, dynamic> json) =>
      _$GetAllCableDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCableDataToJson(this);
}


@JsonSerializable()
class CableData {
  final int? cpId;
  final String? name;
  final String? price;
  final String? userprice;
  final String? agentprice;
  final String? vendorprice;
  final String? planid;
  final dynamic type;
  final int? cableprovider;
  final String? day;

  CableData({
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
  });

  factory CableData.fromJson(Map<String, dynamic> json) =>
      _$CableDataFromJson(json);

  Map<String, dynamic> toJson() => _$CableDataToJson(this);
}
