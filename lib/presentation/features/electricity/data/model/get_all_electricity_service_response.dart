import 'package:json_annotation/json_annotation.dart';

part 'get_all_electricity_service_response.g.dart';

@JsonSerializable()
class ElectricityResponse {
  final bool? status;
  final List<ElectricityProvider>? data;

  ElectricityResponse({this.status, this.data});

  factory ElectricityResponse.fromJson(Map<String, dynamic> json) =>
      _$ElectricityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ElectricityResponseToJson(this);
}

@JsonSerializable()
class ElectricityProvider {
  final int? eId;
  final String? electricityId;
  final String? provider;
  final String? abbreviation;
  final String? providerStatus;

  ElectricityProvider({
    this.eId,
    this.electricityId,
    this.provider,
    this.abbreviation,
    this.providerStatus,
  });

  factory ElectricityProvider.fromJson(Map<String, dynamic> json) =>
      _$ElectricityProviderFromJson(json);

  Map<String, dynamic> toJson() => _$ElectricityProviderToJson(this);
}
