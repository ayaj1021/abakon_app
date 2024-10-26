import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/repository/get_all_airtime_data_repository.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/notifier/get_all_airtime_service_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllAirtimeServicesNotifier
    extends AutoDisposeNotifier<GetAllAirtimeServicesState> {
  GetAllAirtimeServicesNotifier();

  late GetAllAirtimeServicesRepository _getAllAirtimeservicesRepository;

  @override
  GetAllAirtimeServicesState build() {
    _getAllAirtimeservicesRepository =
        ref.read(getAllAirtimeServicesRepositoryProvider);

    return GetAllAirtimeServicesState.initial();
  }

  Future<void> getAllAirtimeServices() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value =
          await _getAllAirtimeservicesRepository.getAllAirtimeServices();

      if (!value.status) throw value.msg.toException;

      state = state.copyWith(
          loadState: LoadState.idle,
          getAllAirtimeServices: AsyncResponse.success(value.data!));

      // state = state.copyWith(
      //     loadState: LoadState.idle,
      //     getAllDetails: GetAllUserDetailsResponse.fromJson(value.data));
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getAllAirtimeServicesNotifierProvider = NotifierProvider.autoDispose<
    GetAllAirtimeServicesNotifier,
    GetAllAirtimeServicesState>(GetAllAirtimeServicesNotifier.new);
