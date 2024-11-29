import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_token_request.g.dart';

@JsonSerializable(createFactory: false)
class SendTokenRequest implements EquatableMixin {
  const SendTokenRequest({
    required this.firebaseToken,
  
  });

  final String firebaseToken;


  Map<String, dynamic> toJson() => _$SendTokenRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [firebaseToken];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
