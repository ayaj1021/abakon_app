import 'package:abakon/core/utils/enums.dart';

class DeleteNotiferState {
  DeleteNotiferState({
    required this.deleteUser,
  });

  final LoadState deleteUser;

  factory DeleteNotiferState.initial() {
    return DeleteNotiferState(
      deleteUser: LoadState.idle,
    );
  }
  DeleteNotiferState copyWith({
    LoadState? deleteUser,
  }) {
    return DeleteNotiferState(
      deleteUser: deleteUser ?? this.deleteUser,
    );
  }
}
