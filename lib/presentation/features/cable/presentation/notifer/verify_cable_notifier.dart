
import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/cable/data/model/verify_cable_request.dart';
import 'package:abakon/presentation/features/cable/data/repository/verify_cable_repository.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/verify_cable_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyCableNotifer extends AutoDisposeNotifier<VerifyCableNotiferState> {
  VerifyCableNotifer();
  late final VerifyCableRepository _verifyCableRepository;
  @override
  VerifyCableNotiferState build() {
    _verifyCableRepository = ref.read(verifyCableRepositoryProvider);
    return VerifyCableNotiferState.initial();
  }

  Future<void> verifyCable({
    required VerifyCableRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(verifyCableState: LoadState.loading);
      final value = await _verifyCableRepository.verifyCable(
        data,
      );
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(verifyCableState: LoadState.idle);
      onSuccess(value.msg.toString());
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(verifyCableState: LoadState.idle);
    }
  }
}

final verifyCableNotifer =
    NotifierProvider.autoDispose<VerifyCableNotifer, VerifyCableNotiferState>(
  VerifyCableNotifer.new,
);
