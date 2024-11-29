import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';

import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/bank_deposits/data/repository/generate_account_repository.dart';
import 'package:abakon/presentation/features/bank_deposits/presentation/notifier/generate_account_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenerateAccountNotifier
    extends AutoDisposeNotifier<GenerateAccountState> {
  GenerateAccountNotifier();

  late GenerateAccountRepository _generateAccountRepository;

  @override
  GenerateAccountState build() {
    _generateAccountRepository = ref.read(generateAccountRepositoryProvider);

    return GenerateAccountState.initial();
  }

  Future<void> generateAccount() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value = await _generateAccountRepository.generateAccount();

      if (!value.status) throw value.msg.toException;

      await SecureStorage().saveBankAccountDetails(value.data!.data!);

      state = state.copyWith(
          loadState: LoadState.idle,
          generateAccountState: AsyncResponse.success(value.data!),
          status: value.status);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final generateAccountNotifierProvider =
    NotifierProvider.autoDispose<GenerateAccountNotifier, GenerateAccountState>(
        GenerateAccountNotifier.new);
