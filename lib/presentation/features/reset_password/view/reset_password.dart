import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:abakon/presentation/features/reset_password/data/model/reset_password_request.dart';
import 'package:abakon/presentation/features/reset_password/notifier/reset_password_notifier.dart';
import 'package:abakon/presentation/features/reset_password/widgets/reset_password_header.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/digit_send_password_field.dart';
import 'package:abakon/presentation/general_widgets/password_validator_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPassword extends ConsumerStatefulWidget {
  const ResetPassword(this.otp, this.email, {super.key});
  final String otp;
  final String email;
  static const routeName = '/resetPassword';

  @override
  ConsumerState<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends ConsumerState<ResetPassword> {
  final ValueNotifier<bool> _isChangePasswordEnabled = ValueNotifier(false);
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmNewPasswordController;
  @override
  void initState() {
    _newPasswordController = TextEditingController()..addListener(_listener);
    _confirmNewPasswordController = TextEditingController()
      ..addListener(_listener);

    super.initState();
  }

  void _listener() {
    _isChangePasswordEnabled.value = _newPasswordController.text.isNotEmpty &&
        _confirmNewPasswordController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _isChangePasswordEnabled.dispose();

    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ResetPasswordHeader(),
              const VerticalSpacing(32),
              AbakonPasswordField(
                controller: _newPasswordController,
                hintText: 'Enter your new password',
                label: 'new password',
              ),
              const VerticalSpacing(10),
              AbakonPasswordField(
                validateFunction: (val) => Validators.confirmPass(
                  val,
                  _newPasswordController.text,
                ),
                controller: _confirmNewPasswordController,
                hintText: 'Confirm your new password',
                label: 'Confirm new password',
              ),
              _confirmNewPasswordController.text.isEmpty
                  ? const SizedBox.shrink()
                  : ValidatorText(
                      isValid: _newPasswordController.text.isNotEmpty &&
                          _newPasswordController.text ==
                              _confirmNewPasswordController.text,
                      text: 'Password match',
                    ),
              const VerticalSpacing(300),
              ValueListenableBuilder(
                  valueListenable: _isChangePasswordEnabled,
                  builder: (context, r, c) {
                    return Consumer(builder: (context, re, c) {
                      final isLoading = re.watch(
                        resetPasswordNotifier
                            .select((v) => v.resetPasswordState.isLoading),
                      );
                      return AbakonSendButton(
                        isLoading: isLoading,
                        isEnabled: r && !isLoading,
                        onTap: () => _resetPassword(),
                        title: 'Update Password',
                      );
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }

  void _resetPassword() {
    final data = ResetPasswordRequest(
      password: _confirmNewPasswordController.text.trim(),
      otp: widget.otp,
      email: widget.email,
    );
    ref.read(resetPasswordNotifier.notifier).resetPassword(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isChangePasswordEnabled.value = false;
            context.showSuccess(message: message);

            context.replaceAll(Login.routeName);
          },
        );
  }
}
