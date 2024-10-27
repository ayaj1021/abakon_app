import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_transaction_pin_request.g.dart';

@JsonSerializable(createFactory: false)
class ChangeTransactionPinRequest implements EquatableMixin {
  const ChangeTransactionPinRequest({
    required this.oldPin,
    required this.newPin,
    required this.confirmNewPin,
  });

  @JsonKey(name: 'old_pin')
  final String oldPin;
   @JsonKey(name: 'new_pin')
  final String newPin;
   @JsonKey(name: 'confirm_new_pin')
  final String confirmNewPin;
  
 

  Map<String, dynamic> toJson() => _$ChangeTransactionPinRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object> get props => [oldPin, newPin, confirmNewPin];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
