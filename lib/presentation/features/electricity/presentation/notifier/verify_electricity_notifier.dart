import 'dart:developer';

import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/electricity/data/model/verify_electricity_request.dart';
import 'package:abakon/presentation/features/electricity/data/repository/verify_electricity_repository.dart';
import 'package:abakon/presentation/features/electricity/presentation/notifier/verify_electricity_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyElectricityNotifer
    extends AutoDisposeNotifier<VerifyElectricityNotiferState> {
  VerifyElectricityNotifer();
  late final VerifyElectricityRepository _verifyElectricityRepository;
  @override
  VerifyElectricityNotiferState build() {
    _verifyElectricityRepository =
        ref.read(verifyElectricityRepositoryProvider);
    return VerifyElectricityNotiferState.initial();
  }

  Future<void> verifyElectricity({
    required VerifyElectricityRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(
        verifyElectricityState: LoadState.loading,
      );
      final value = await _verifyElectricityRepository.verifyElectricity(
        data,
      );

      if (!value.status) throw value.msg.toException;

      state = state.copyWith(
        verifyElectricityState: LoadState.idle,
      );
      onSuccess(value.data!.msg.toString());
      log(value.msg.toString());
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(verifyElectricityState: LoadState.idle);
    }
  }
}

final verifyElectricityNotifer = NotifierProvider.autoDispose<
    VerifyElectricityNotifer, VerifyElectricityNotiferState>(
  VerifyElectricityNotifer.new,
);
