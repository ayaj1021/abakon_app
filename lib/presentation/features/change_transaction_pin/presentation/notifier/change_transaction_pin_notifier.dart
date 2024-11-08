import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/change_transaction_pin/data/model/change_transaction_pin_request.dart';
import 'package:abakon/presentation/features/change_transaction_pin/data/repository/change_transaction_pin_repository.dart';
import 'package:abakon/presentation/features/change_transaction_pin/presentation/notifier/change_transaction_pin_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeTransactionPinNotifer
    extends AutoDisposeNotifier<ChangeTransactionPinState> {
  ChangeTransactionPinNotifer();
  late final ChangeTransactionPinRepository _changeTransactionPinRepository;
  @override
  ChangeTransactionPinState build() {
    _changeTransactionPinRepository =
        ref.read(changeTransactionPinRepositoryProvider);
    return ChangeTransactionPinState.initial();
  }

  Future<void> changeTransactionPin({
    required ChangeTransactionPinRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(changeTransactionPinState: LoadState.loading);
      final value = await _changeTransactionPinRepository.changeTransactionPin(
        data,
      );
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(changeTransactionPinState: LoadState.idle);
      onSuccess(value.data!.msg.toString());
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(changeTransactionPinState: LoadState.idle);
    }
  }
}

final changeTransactionPinNotifer = NotifierProvider.autoDispose<
    ChangeTransactionPinNotifer, ChangeTransactionPinState>(
  ChangeTransactionPinNotifer.new,
);
