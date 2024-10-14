import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/services/data/model/get_all_services_response.dart';

class GetAllTransactionsState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<GetAllServicesResponse> getAllServices;
  // final GetAllUserDetailsResponse getAllDetails;

  GetAllTransactionsState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllServices,
  });

  factory GetAllTransactionsState.initial() {
    return GetAllTransactionsState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllServices: AsyncResponse.loading(),
     // getAllDetails: GetAllUserDetailsResponse(),
    );
  }

  GetAllTransactionsState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<GetAllServicesResponse>? getAllServices,
    //GetAllUserDetailsResponse? getAllDetails,
  }) {
    return GetAllTransactionsState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllServices: getAllServices ?? this.getAllServices,
    );
  }
}
