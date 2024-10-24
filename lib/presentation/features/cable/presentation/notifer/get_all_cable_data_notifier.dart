import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/cable/data/repository/get_all_cable_data_repository.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/get_all_cable_data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllCableDataNotifier
    extends AutoDisposeNotifier<GetAllCableDataState> {
  GetAllCableDataNotifier();

  late GetAllCableDataRepository _getAllCableDataRepository;

  @override
  GetAllCableDataState build() {
    _getAllCableDataRepository = ref.read(getAllCableDataRepositoryProvider);

    return GetAllCableDataState.initial();
  }

  Future<void> getAllCableData() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value = await _getAllCableDataRepository.getAllCableData();

      if (!value.status) throw value.msg.toException;

      state = state.copyWith(
          loadState: LoadState.idle,
          getAllExamData: AsyncResponse.success(value.data!));

      // state = state.copyWith(
      //     loadState: LoadState.idle,
      //     getAllDetails: GetAllUserDetailsResponse.fromJson(value.data));
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getAllCableDataNotifierProvider =
    NotifierProvider.autoDispose<GetAllCableDataNotifier, GetAllCableDataState>(
        GetAllCableDataNotifier.new);
