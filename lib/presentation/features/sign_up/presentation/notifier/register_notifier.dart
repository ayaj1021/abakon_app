import 'package:abakon/core/config/exception/logger.dart';
import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/sign_up/data/models/sign_up_request.dart';
import 'package:abakon/presentation/features/sign_up/data/repository/register_repository.dart';
import 'package:abakon/presentation/features/sign_up/presentation/notifier/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterNotifier extends AutoDisposeNotifier<RegisterNotifierState> {
  RegisterNotifier();

  late RegisterRepository _registerRepository;
  // late UserAuthRepository _userAuthRepository;
  // late UserRepository _userRepository;
  @override
  RegisterNotifierState build() {
    _registerRepository = ref.read(registerRepositoryProvider);
    // _userAuthRepository = ref.read(userAuthRepositoryProvider);
    // _userRepository = ref.read(userRepositoryProvider);
    return RegisterNotifierState.initial();
  }

  void allInputValid({
    required bool firstNameValid,
    required bool lastNameValid,
    required bool phoneNumberValid,
    required bool emailValid,
    required bool passwordValid,
    required bool transactionPinValid,
    required bool stateValid,

    //   String? firstName,
    // String? lastName,
    // String? email,
    // String? phone,
    // String? password,
    // String? transactionPin,
    // String? state,
  }) {
    state = state.copyWith(
      inputValid: emailValid &&
          passwordValid &&
          firstNameValid &&
          lastNameValid &&
          phoneNumberValid &&
          transactionPinValid &&
          stateValid,
    );
  }

  Future<void> signUp({
    required SignUpRequest data,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    state = state.copyWith(registerState: LoadState.loading);

    try {
      final value = await _registerRepository.signUp(data);
      debugLog(data);
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(registerState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(registerState: LoadState.idle);
    }
  }

  // Future<void> saveUser(LoginResponse res) async {
  //   final user = DSUser(
  //     email: res.email ?? '',
  //     firstName: res.firstName ?? '',
  //     lastName: res.lastName ?? '',
  //   );
  //   await _userRepository.updateUser(user);
  // }

  // Future<void> saveToken(Tokens token) async {
  //   await _userAuthRepository.saveToken(token);
  // }
}

final registerNotifier =
    NotifierProvider.autoDispose<RegisterNotifier, RegisterNotifierState>(
  RegisterNotifier.new,
);
