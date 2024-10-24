import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable(createFactory: false)
class ChangePasswordRequest implements EquatableMixin {
  const ChangePasswordRequest({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  @JsonKey(name: 'old_password')
  final String oldPassword;
   @JsonKey(name: 'new_password')
  final String newPassword;
   @JsonKey(name: 'confirm_new_password')
  final String confirmNewPassword;
  
 

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object> get props => [oldPassword, newPassword, confirmNewPassword];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
