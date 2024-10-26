import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/electricity/data/model/get_all_electricity_service_response.dart';

class GetAllElectricityServiceState {
  final bool isLoading;

  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<ElectricityResponse> getAllElectricityService;

  GetAllElectricityServiceState({
    required this.isLoading,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllElectricityService,
  });

  factory GetAllElectricityServiceState.initial() {
    return GetAllElectricityServiceState(
      isLoading: false,

      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllElectricityService: AsyncResponse.loading(),
      // getAllDetails: GetAllUserDetailsResponse(),
    );
  }

  GetAllElectricityServiceState copyWith({
    bool? isLoading,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<ElectricityResponse>? getAllElectricityService,
    //GetAllUserDetailsResponse? getAllDetails,
  }) {
    return GetAllElectricityServiceState(
      isLoading: isLoading ?? this.isLoading,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllElectricityService:
          getAllElectricityService ?? this.getAllElectricityService,
    );
  }
}
