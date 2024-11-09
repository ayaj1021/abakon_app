import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/cable/data/model/buy_cable_request.dart';
import 'package:abakon/presentation/features/cable/data/repository/buy_cable_repository.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/buy_cable_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyCableNotifer extends AutoDisposeNotifier<BuyCableNotiferState> {
  BuyCableNotifer();
  late final BuyCableRepository _buyCableRepository;
  @override
  BuyCableNotiferState build() {
    _buyCableRepository = ref.read(buyCableRepositoryProvider);
    return BuyCableNotiferState.initial();
  }

  Future<void> buyCable({
    required BuyCableRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(buyCableState: LoadState.loading);
      final value = await _buyCableRepository.buyCable(
        data,
      );
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(buyCableState: LoadState.idle);
      onSuccess(value.data?.msg ?? 'Successful');
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(buyCableState: LoadState.idle);
    }
  }
}

final buyCableNotifer =
    NotifierProvider.autoDispose<BuyCableNotifer, BuyCableNotiferState>(
  BuyCableNotifer.new,
);
