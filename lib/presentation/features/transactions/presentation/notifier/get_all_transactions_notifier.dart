import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';

import 'package:abakon/presentation/features/transactions/data/repository/get_all_transactions_repository.dart';
import 'package:abakon/presentation/features/transactions/presentation/notifier/get_all_transaction_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllTransactionsNotifier
    extends AutoDisposeNotifier<GetAllTransactionsState> {
  GetAllTransactionsNotifier();

  late GetAllTransactionsRepository _getAllTransactionsRepository;

  @override
  GetAllTransactionsState build() {
    _getAllTransactionsRepository =
        ref.read(getAllTransactionsRepositoryProvider);

    return GetAllTransactionsState.initial();
  }

  Future<void> getAllTransactions() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value = await _getAllTransactionsRepository.getAllTransactions();

      if (!value.status) throw value.msg.toException;

      state = state.copyWith(
          loadState: LoadState.idle,
          getAllTransactions: AsyncResponse.success(value.data!));
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getAllTransactionsNotifierProvider = NotifierProvider.autoDispose<
    GetAllTransactionsNotifier,
    GetAllTransactionsState>(GetAllTransactionsNotifier.new);
