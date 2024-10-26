import 'package:json_annotation/json_annotation.dart';

part 'get_all_cable_data_response.g.dart';

@JsonSerializable()
class GetAllCableData {
  final bool? status;
  final List<CableData>? data;

  GetAllCableData({this.status, this.data});

  factory GetAllCableData.fromJson(Map<String, dynamic> json) =>
      _$GetAllCableDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCableDataToJson(this);
}

@JsonSerializable()
class CableData {
  final int? cpId;
  final String? name;
  final String? price;
  final String? userPrice;
  final String? agentPrice;
  final String? vendorPrice;
  final String? planId;
  final String? type;
  final int? cableProvider;
  final String? day;
  final int? cId;
  final String? cableId;
  final String? provider;
  final String? providerStatus;

  CableData({
    this.cpId,
    this.name,
    this.price,
    this.userPrice,
    this.agentPrice,
    this.vendorPrice,
    this.planId,
    this.type,
    this.cableProvider,
    this.day,
    this.cId,
    this.cableId,
    this.provider,
    this.providerStatus,
  });

  factory CableData.fromJson(Map<String, dynamic> json) =>
      _$CableDataFromJson(json);

  Map<String, dynamic> toJson() => _$CableDataToJson(this);
}
