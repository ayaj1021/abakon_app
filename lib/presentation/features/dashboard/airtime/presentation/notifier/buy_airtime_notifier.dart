import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_request.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/repository/buy_airtime_repository.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/notifier/buy_airtime_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyAirtimeNotifer extends AutoDisposeNotifier<BuyAirtimeNotiferState> {
  BuyAirtimeNotifer();
  late final BuyAirtimeRepository _buyAirtimeRepository;
  @override
  BuyAirtimeNotiferState build() {
    _buyAirtimeRepository = ref.read(buyAirtimeRepositoryProvider);
    return BuyAirtimeNotiferState.initial();
  }

  Future<void> buyAirtime({
    required BuyAirtimeRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(buyAirtimeState: LoadState.loading);
      final value = await _buyAirtimeRepository.buyData(
        data,
      );
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(buyAirtimeState: LoadState.idle);
      onSuccess(value.data?.msg ?? 'Successful');
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(buyAirtimeState: LoadState.idle);
    }
  }
}

final buyAirtimeNotifer =
    NotifierProvider.autoDispose<BuyAirtimeNotifer, BuyAirtimeNotiferState>(
  BuyAirtimeNotifer.new,
);
