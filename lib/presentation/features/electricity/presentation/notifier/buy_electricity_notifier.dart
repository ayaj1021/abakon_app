import 'dart:developer';

import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/electricity/data/model/buy_electricity_request.dart';
import 'package:abakon/presentation/features/electricity/data/repository/buy_electricity_repository.dart';
import 'package:abakon/presentation/features/electricity/presentation/notifier/buy_electricity_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyElectricityNotifer
    extends AutoDisposeNotifier<BuyElectricityNotiferState> {
  BuyElectricityNotifer();
  late final BuyElectricityRepository _buyElectricityRepository;
  @override
  BuyElectricityNotiferState build() {
    _buyElectricityRepository = ref.read(buyElectricityRepositoryProvider);
    return BuyElectricityNotiferState.initial();
  }

  Future<void> buyElectricity({
    required BuyElectricityRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(
        buyElectricityState: LoadState.loading,
      );
      final value = await _buyElectricityRepository.buyElectricity(
        data,
      );

      if (!value.status) throw value.msg.toException;

      state = state.copyWith(
        buyElectricityState: LoadState.idle,
      );
      onSuccess(value.msg.toString());
      
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(buyElectricityState: LoadState.idle);
    }
  }
}

final buyElectricityNotifer = NotifierProvider.autoDispose<
    BuyElectricityNotifer, BuyElectricityNotiferState>(
  BuyElectricityNotifer.new,
);
