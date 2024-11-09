import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_data_request.g.dart';

@JsonSerializable(createFactory: false)
class BuyDataRequest implements EquatableMixin {
  const BuyDataRequest({
    required this.network,
    required this.phone,
    required this.portedNumber,
    required this.dataPlan,
  
  });

  final String network;
  final String phone;
  @JsonKey(defaultValue: "ported_number")
  final String portedNumber;
   @JsonKey(defaultValue: "data_plan")
  final String dataPlan;


  Map<String, dynamic> toJson() => _$BuyDataRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [network, phone,  portedNumber, dataPlan];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
