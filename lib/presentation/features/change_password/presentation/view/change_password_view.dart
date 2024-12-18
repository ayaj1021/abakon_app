import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/change_password/data/model/change_password_request.dart';
import 'package:abakon/presentation/features/change_password/presentation/notifier/change_password_notifier.dart';
import 'package:abakon/presentation/features/change_password/presentation/widget/change_password_header.dart';
import 'package:abakon/presentation/features/change_password/presentation/widget/change_password_section.dart';
import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordView extends ConsumerStatefulWidget {
  const ChangePasswordView({super.key});
  static const routeName = '/changePassword';

  @override
  ConsumerState<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends ConsumerState<ChangePasswordView> {
  final ValueNotifier<bool> _isChangePasswordEnabled = ValueNotifier(false);
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmNewPasswordController;
  @override
  void initState() {
    _currentPasswordController = TextEditingController()
      ..addListener(_listener);
    _newPasswordController = TextEditingController()..addListener(_listener);
    _confirmNewPasswordController = TextEditingController()
      ..addListener(_listener);

    super.initState();
  }

  void _listener() {
    _isChangePasswordEnabled.value =
        _currentPasswordController.text.isNotEmpty &&
            _newPasswordController.text.isNotEmpty &&
            _confirmNewPasswordController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _isChangePasswordEnabled.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChangePasswordHeader(),
              const VerticalSpacing(32),
              ChangePasswordSection(
                currentPasswordController: _currentPasswordController,
                newPasswordController: _newPasswordController,
                confirmNewPasswordController: _confirmNewPasswordController,
              ),
              const VerticalSpacing(300),
              ValueListenableBuilder(
                  valueListenable: _isChangePasswordEnabled,
                  builder: (context, r, c) {
                    return Consumer(builder: (context, re, c) {
                      final isLoading = re.watch(
                        changePasswordNotifer
                            .select((v) => v.changePasswordState.isLoading),
                      );
                      return AbakonSendButton(
                        isLoading: isLoading,
                        isEnabled: r && !isLoading,
                        onTap: () => _changePassword(),
                        title: 'Update Password',
                      );
                    });
                  })
            ],
          ),
        ),
      )),
    );
  }

  void _changePassword() {
    final data = ChangePasswordRequest(
      oldPassword: _currentPasswordController.text.trim(),
      newPassword: _newPasswordController.text.trim(),
      confirmNewPassword: _confirmNewPasswordController.text.trim(),
    );
    ref.read(changePasswordNotifer.notifier).changePassword(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isChangePasswordEnabled.value = false;
            context.showSuccess(message: message);
            // log('Login successfull');
            context.replaceAll(Login.routeName);
          },
        );
  }
}
