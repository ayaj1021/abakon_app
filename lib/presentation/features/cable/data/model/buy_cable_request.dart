import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_cable_request.g.dart';

@JsonSerializable(createFactory: false)
class BuyCableRequest implements EquatableMixin {
  const BuyCableRequest({
    required this.iucNumber,
    required this.cableName,
    required this.cablePlan,
    required this.subtype,
    required this.phone,
  });

  final String iucNumber;

  final String cableName;
  final String cablePlan;
  final String subtype;
  final String phone;

  Map<String, dynamic> toJson() => _$BuyCableRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [iucNumber, cableName, cablePlan, subtype, phone];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
  // "iucnumber": "123456789",
  // "cablename": 3,
  // "cableplan": 13,
  //  "subtype": 3 ,
  // "phone": "+2341234567890"