import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/electricity/data/repository/get_all_electricity_service_repository.dart';
import 'package:abakon/presentation/features/electricity/presentation/notifier/get_all_electricity_service_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllElectricityServiceNotifier
    extends AutoDisposeNotifier<GetAllElectricityServiceState> {
  GetAllElectricityServiceNotifier();

  late GetAllElectricityServiceRepository _getAllElectricServiceRepository;

  @override
  GetAllElectricityServiceState build() {
    _getAllElectricServiceRepository =
        ref.read(getAllElectricityServiceRepositoryProvider);

    return GetAllElectricityServiceState.initial();
  }

  Future<void> getAllElectricityService() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value =
          await _getAllElectricServiceRepository.getAllElectricityService();

      if (!value.status) throw value.msg.toException;

      state = state.copyWith(
          loadState: LoadState.idle,
          getAllElectricityService: AsyncResponse.success(value.data!));
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getAllElectricityServiceNotifierProvider = NotifierProvider.autoDispose<
    GetAllElectricityServiceNotifier,
    GetAllElectricityServiceState>(GetAllElectricityServiceNotifier.new);
