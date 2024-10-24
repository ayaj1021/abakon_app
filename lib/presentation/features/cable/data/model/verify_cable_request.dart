import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_cable_request.g.dart';

@JsonSerializable(createFactory: false)
class VerifyCableRequest implements EquatableMixin {
  const VerifyCableRequest({
    required this.smartCardNumber,
    required this.cablename,
  });

  @JsonKey(defaultValue: "smart_card_number")
  final String smartCardNumber;

  final String cablename;

  Map<String, dynamic> toJson() => _$VerifyCableRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [smartCardNumber, cablename];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
