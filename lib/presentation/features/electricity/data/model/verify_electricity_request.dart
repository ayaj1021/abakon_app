import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_electricity_request.g.dart';

@JsonSerializable(createFactory: false)
class VerifyElectricityRequest implements EquatableMixin {
  const VerifyElectricityRequest({
    required this.provider,
    required this.meternumber,
    required this.metertype,
  });

  final String provider;

  final String meternumber;
  final String metertype;

  Map<String, dynamic> toJson() => _$VerifyElectricityRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [provider, meternumber, metertype];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
