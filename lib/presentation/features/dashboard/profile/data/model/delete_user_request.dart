import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_user_request.g.dart';

@JsonSerializable(createFactory: false)
class DeleteUserRequest implements EquatableMixin {
  const DeleteUserRequest({
    required this.apiToken,
  });

  final String apiToken;

  Map<String, dynamic> toJson() => _$DeleteUserRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [apiToken];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
