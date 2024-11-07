import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/login/data/models/login_request.dart';
import 'package:abakon/presentation/features/login/data/repository/login_repository.dart';
import 'package:abakon/presentation/features/login/presentation/notifier/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifer extends AutoDisposeNotifier<LoginNotiferState> {
  LoginNotifer();
  late final LoginRepository _loginRepository;
  @override
  LoginNotiferState build() {
    _loginRepository = ref.read(loginRepositoryProvider);
    return LoginNotiferState.initial();
  }

  Future<void> login({
    required LoginRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(loginState: LoadState.loading);
      final value = await _loginRepository.login(
        data,
      );
      if (!value.status) throw value.msg.toException;

      await SecureStorage().saveUserAccessToken(value.data!.accessToken.toString());
      await SecureStorage().saveUserToken(value.data!.token.toString());

      state = state.copyWith(loginState: LoadState.idle);
      onSuccess(value.msg.toString());
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(loginState: LoadState.idle);
    }
  }

  Future<void> logout({
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(logoutState: LoadState.loading);

      state = state.copyWith(logoutState: LoadState.success);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(loginState: LoadState.idle);
    }
  }
}

final loginNotifer =
    NotifierProvider.autoDispose<LoginNotifer, LoginNotiferState>(
  LoginNotifer.new,
);
