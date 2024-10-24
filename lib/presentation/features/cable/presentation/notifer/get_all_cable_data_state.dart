import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/cable/data/model/get_all_cable_data_response.dart';

class GetAllCableDataState {
  final bool isLoading;

  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<GetAllCableData> getAllCableData;

  GetAllCableDataState({
    required this.isLoading,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllCableData,
  });

  factory GetAllCableDataState.initial() {
    return GetAllCableDataState(
      isLoading: false,

      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllCableData: AsyncResponse.loading(),
      // getAllDetails: GetAllUserDetailsResponse(),
    );
  }

  GetAllCableDataState copyWith({
    bool? isLoading,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<GetAllCableData>? getAllExamData,
    //GetAllUserDetailsResponse? getAllDetails,
  }) {
    return GetAllCableDataState(
      isLoading: isLoading ?? this.isLoading,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllCableData: getAllExamData ?? this.getAllCableData,
    );
  }
}
