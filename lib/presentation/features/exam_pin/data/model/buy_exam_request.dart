import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_exam_request.g.dart';

@JsonSerializable(createFactory: false)
class BuyExamRequest implements EquatableMixin {
  const BuyExamRequest({
    required this.portedNumber,
    required this.provider,
    required this.quantity,
  });

  final String provider;
  final String quantity;

  @JsonKey(defaultValue: "ported_number")
  final String portedNumber;

  Map<String, dynamic> toJson() => _$BuyExamRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [provider, quantity, portedNumber];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
