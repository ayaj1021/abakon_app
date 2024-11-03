import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_electricity_request.g.dart';

@JsonSerializable(createFactory: false)
class BuyElectricityRequest implements EquatableMixin {
  const BuyElectricityRequest({
    required this.provider,
    required this.meternumber,
    required this.metertype,
    required this.amount,
    required this.phone,
  });

  final String provider;
  final String amount;
  final String phone;

  final String meternumber;
  final String metertype;

  Map<String, dynamic> toJson() => _$BuyElectricityRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [provider, meternumber, metertype, amount, phone];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}

//  "provider": "8",  
//     "meternumber": "230401091870",  
//     "amount": 1500,    
//     "metertype": "Prepaid",  
//     "phone": "08101126131" 