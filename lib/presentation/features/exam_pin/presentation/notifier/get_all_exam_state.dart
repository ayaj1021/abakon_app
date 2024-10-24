import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/exam_pin/data/model/get_all_exam_data_response.dart';

class GetAllExamDataState {
  final bool isLoading;

  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<GetAllExamData> getAllExamData;

  GetAllExamDataState({
    required this.isLoading,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllExamData,
  });

  factory GetAllExamDataState.initial() {
    return GetAllExamDataState(
      isLoading: false,

      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllExamData: AsyncResponse.loading(),
      // getAllDetails: GetAllUserDetailsResponse(),
    );
  }

  GetAllExamDataState copyWith({
    bool? isLoading,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<GetAllExamData>? getAllExamData,
    //GetAllUserDetailsResponse? getAllDetails,
  }) {
    return GetAllExamDataState(
      isLoading: isLoading ?? this.isLoading,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllExamData: getAllExamData ?? this.getAllExamData,
    );
  }
}
