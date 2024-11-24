import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/exam_pin/data/model/buy_exam_request.dart';
import 'package:abakon/presentation/features/exam_pin/data/repository/buy_exam_repository.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/notifier/buy_exam_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyExamNotifer extends AutoDisposeNotifier<BuyExamNotiferState> {
  BuyExamNotifer();
  late final BuyExamRepository _buyExamRepository;
  @override
  BuyExamNotiferState build() {
    _buyExamRepository = ref.read(buyExamRepositoryProvider);
    return BuyExamNotiferState.initial();
  }

  Future<void> buyExam({
    required BuyExamRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(buyExamState: LoadState.loading);
      final value = await _buyExamRepository.buyExam(
        data,
      );
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(buyExamState: LoadState.idle);
      onSuccess(value.data?.msg ?? 'Successful');
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(buyExamState: LoadState.idle);
    }
  }
}

final buyExamNotifer =
    NotifierProvider.autoDispose<BuyExamNotifer, BuyExamNotiferState>(
  BuyExamNotifer.new,
);
