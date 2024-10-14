import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/services/data/respository/get_all_services_repository.dart';
import 'package:abakon/presentation/features/services/notifier/get_all_services_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllServicesNotifier
    extends AutoDisposeNotifier<GetAllTransactionsState> {
  GetAllServicesNotifier();

  late GetAllServicesRepository _getAllservicesRepository;

  @override
  GetAllTransactionsState build() {
    _getAllservicesRepository = ref.read(getAllServicesRepositoryProvider);

    return GetAllTransactionsState.initial();
  }

  Future<void> getAllServices() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value = await _getAllservicesRepository.getAllServices();

      if (!value.status) throw value.msg.toException;


      state = state.copyWith(
          loadState: LoadState.idle,
          getAllServices: AsyncResponse.success(value.data!));


      // state = state.copyWith(
      //     loadState: LoadState.idle,
      //     getAllDetails: GetAllUserDetailsResponse.fromJson(value.data));
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}


final getAllServicesNotifierProvider =
    NotifierProvider.autoDispose<GetAllServicesNotifier, GetAllTransactionsState>(GetAllServicesNotifier.new);


