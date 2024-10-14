import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequest implements EquatableMixin {
  const LoginRequest({
    required this.phone,
    required this.password,
  });

  final String phone;
  final String password;

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object> get props => [phone, password];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
