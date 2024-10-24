import 'package:json_annotation/json_annotation.dart';

part 'get_all_data_service_response.g.dart';

@JsonSerializable()
class DataResponse {
  final String? status;
  final List<Plan>? data;

  DataResponse({this.status, this.data});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class Plan {
  final int? pId;
  final String? name;
  final String? price;
  final String? userPrice;
  final String? agentPrice;
  final String? vendorPrice;
  final String? planId;
  final String? type;
  final int? dataNetwork;
  final String? day;

  Plan({
    this.pId,
    this.name,
    this.price,
    this.userPrice,
    this.agentPrice,
    this.vendorPrice,
    this.planId,
    this.type,
    this.dataNetwork,
    this.day,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
