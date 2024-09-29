import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/home/data/model/get_user_details_response.dart';

class GetAllUserDetailsState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<GetAllUserDetailsResponse> getAllDetails;
  // final GetAllUserDetailsResponse getAllDetails;

  GetAllUserDetailsState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllDetails,
  });

  factory GetAllUserDetailsState.initial() {
    return GetAllUserDetailsState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllDetails: AsyncResponse.loading(),
     // getAllDetails: GetAllUserDetailsResponse(),
    );
  }

  GetAllUserDetailsState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<GetAllUserDetailsResponse>? getAllDetails,
    //GetAllUserDetailsResponse? getAllDetails,
  }) {
    return GetAllUserDetailsState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllDetails: getAllDetails ?? this.getAllDetails,
    );
  }
}
