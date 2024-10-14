import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/transactions/data/model/get_all_transactions_response.dart';

class GetAllTransactionsState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<GetAllTransactionsResponse> getAllTransactions;
  // final GetAllUserDetailsResponse getAllDetails;

  GetAllTransactionsState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllTransactions,
  });

  factory GetAllTransactionsState.initial() {
    return GetAllTransactionsState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllTransactions: AsyncResponse.loading(),
    
    );
  }

  GetAllTransactionsState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<GetAllTransactionsResponse>? getAllTransactions,

  }) {
    return GetAllTransactionsState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllTransactions: getAllTransactions ?? this.getAllTransactions,
    );
  }
}
