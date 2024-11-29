import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/bank_deposits/data/model/generate_account_response.dart';

class GenerateAccountState {
  final bool isLoading;
  final bool status;
  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<GenerateAccountResponse> generateAccountState;

  GenerateAccountState({
    required this.isLoading,
    required this.status,
    this.error,
    this.message,
    required this.loadState,
    required this.generateAccountState,
  });

  factory GenerateAccountState.initial() {
    return GenerateAccountState(
      isLoading: false,
      status: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      generateAccountState: AsyncResponse.loading(),
    );
  }

  GenerateAccountState copyWith({
    bool? isLoading,
    bool? status,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<GenerateAccountResponse>? generateAccountState,
  }) {
    return GenerateAccountState(
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      error: message,
      loadState: loadState ?? this.loadState,
      generateAccountState: generateAccountState ?? this.generateAccountState,
    );
  }
}
