import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/exam_pin/data/repository/get_all_exam_data_repository.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/notifier/get_all_exam_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllExamDataNotifier extends AutoDisposeNotifier<GetAllExamDataState> {
  GetAllExamDataNotifier();

  late GetAllExamDataRepository _getAllExamDataRepository;

  @override
  GetAllExamDataState build() {
    _getAllExamDataRepository = ref.read(getAllExamDataRepositoryProvider);

    return GetAllExamDataState.initial();
  }

  Future<void> getAllExamData() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value = await _getAllExamDataRepository.getAllExamData();

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

final getAllExamDataNotifierProvider =
    NotifierProvider.autoDispose<GetAllExamDataNotifier, GetAllExamDataState>(
        GetAllExamDataNotifier.new);
