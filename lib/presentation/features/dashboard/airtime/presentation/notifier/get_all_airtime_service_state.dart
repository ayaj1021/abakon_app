import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/get_all_airtime_service_response.dart';

class GetAllAirtimeServicesState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<AirtimeResponse> getAllAirtimeServices;
  // final GetAllUserDetailsResponse getAllDetails;

  GetAllAirtimeServicesState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllAirtimeServices,
  });

  factory GetAllAirtimeServicesState.initial() {
    return GetAllAirtimeServicesState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllAirtimeServices: AsyncResponse.loading(),
     // getAllDetails: GetAllUserDetailsResponse(),
    );
  }

  GetAllAirtimeServicesState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<AirtimeResponse>? getAllAirtimeServices,
    //GetAllUserDetailsResponse? getAllDetails,
  }) {
    return GetAllAirtimeServicesState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllAirtimeServices: getAllAirtimeServices ?? this.getAllAirtimeServices,
    );
  }
}
