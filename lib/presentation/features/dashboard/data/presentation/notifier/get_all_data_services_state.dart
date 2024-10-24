import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/get_all_data_service_response.dart';

class GetAllDataServicesState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<DataResponse> getAllDataServices;
  // final GetAllUserDetailsResponse getAllDetails;

  GetAllDataServicesState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllDataServices,
  });

  factory GetAllDataServicesState.initial() {
    return GetAllDataServicesState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllDataServices: AsyncResponse.loading(),
     // getAllDetails: GetAllUserDetailsResponse(),
    );
  }

  GetAllDataServicesState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<DataResponse>? getAllDataServices,
    //GetAllUserDetailsResponse? getAllDetails,
  }) {
    return GetAllDataServicesState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllDataServices: getAllDataServices ?? this.getAllDataServices,
    );
  }
}
