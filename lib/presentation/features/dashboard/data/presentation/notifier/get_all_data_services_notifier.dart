import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/data/data/repository/get_data_services_repository.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/notifier/get_all_data_services_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllDataServicesNotifier
    extends AutoDisposeNotifier<GetAllDataServicesState> {
  GetAllDataServicesNotifier();

  late GetAllDataServicesRepository _getAllDataservicesRepository;

  @override
  GetAllDataServicesState build() {
    _getAllDataservicesRepository = ref.read(getAllDataServicesRepositoryProvider);

    return GetAllDataServicesState.initial();
  }

  Future<void> getAllDataServices() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value = await _getAllDataservicesRepository.getAllDataServices();

      if (!value.status) throw value.msg.toException;


      state = state.copyWith(
          loadState: LoadState.idle,
          getAllDataServices: AsyncResponse.success(value.data!));


      // state = state.copyWith(
      //     loadState: LoadState.idle,
      //     getAllDetails: GetAllUserDetailsResponse.fromJson(value.data));
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}


final getAllDataServicesNotifierProvider =
    NotifierProvider.autoDispose<GetAllDataServicesNotifier, GetAllDataServicesState>(GetAllDataServicesNotifier.new);


