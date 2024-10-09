import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_airtime_request.g.dart';

@JsonSerializable(createFactory: false)
class BuyAirtimeRequest implements EquatableMixin {
  const BuyAirtimeRequest({
    required this.network,
    required this.phone,
    required this.amount,
    required this.portedNumber,
    required this.airtimeType,
    required this.ref,
  });

  final String network;
  final String phone;
  final String amount;
  @JsonKey(defaultValue: "ported_number")
  final String portedNumber;
  @JsonKey(defaultValue: "airtime_type")
  final String airtimeType;
  final String ref;

  Map<String, dynamic> toJson() => _$BuyAirtimeRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props =>
      [network, phone, amount, portedNumber, airtimeType, ref];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
