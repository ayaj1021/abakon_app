import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/buy_data_request.dart';
import 'package:abakon/presentation/features/dashboard/data/data/repository/buy_data_repository.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/notifier/buy_data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyDataNotifer extends AutoDisposeNotifier<BuyDataNotiferState> {
  BuyDataNotifer();
  late final BuyDataRepository _buyDataRepository;
  @override
  BuyDataNotiferState build() {
    _buyDataRepository = ref.read(buyDataRepositoryProvider);
    return BuyDataNotiferState.initial();
  }

  Future<void> buyData({
    required BuyDataRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(buyDataState: LoadState.loading);
      final value = await _buyDataRepository.buyData(
        data,
      );
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(buyDataState: LoadState.idle);
      onSuccess(value.data!.msg.toString());
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(buyDataState: LoadState.idle);
    }
  }
}

final buyDataNotifer =
    NotifierProvider.autoDispose<BuyDataNotifer, BuyDataNotiferState>(
  BuyDataNotifer.new,
);
