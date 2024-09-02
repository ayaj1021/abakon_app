import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/features/login/data/models/login_request.dart';
import 'package:abakon/presentation/features/login/presentation/notifier/login_notifier.dart';
import 'package:abakon/presentation/features/login/presentation/widgets/forgot_password_bottomsheet.dart';
import 'package:abakon/presentation/features/login/presentation/widgets/login_input_section.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});
  static const routeName = '/login';

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final ValueNotifier<bool> _isLoginEnabled = ValueNotifier(false);
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
  final _emailAddressController  = TextEditingController();

  @override
  void initState() {
    _phoneNumberController = TextEditingController()..addListener(_listener);
    _passwordController = TextEditingController()..addListener(_listener);
    super.initState();
  }

  void _listener() {
    _isLoginEnabled.value = _phoneNumberController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _isLoginEnabled.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacing(25),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primary591E0C,
                  ),
                ),
                Text(
                  Strings.welcome('Joseph'),
                  style: context.textTheme.s20w900.copyWith(
                    color: AppColors.primary591E0C,
                  ),
                ),
                Text(
                  Strings.logInYourAccount,
                  style: context.textTheme.s12w400
                      .copyWith(color: AppColors.primary010101),
                ),
                const VerticalSpacing(70),
                LoginInputSection(
                  passwordController: _passwordController,
                  phoneNumbercontroller: _phoneNumberController,
                ),
                GestureDetector(
                  onTap: () => forgotPasswordBottomSheet(
                    context: context,
                    emailAddressController: _emailAddressController,
                  ),
                  //context.pushNamed<void>(ForgotPassword.routeName),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${Strings.forgotPassword}?',
                      style: context.textTheme.s12w400.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ), //color: AppColors.primary433C65,

                const VerticalSpacing(150),
                ValueListenableBuilder(
                  valueListenable: _isLoginEnabled,
                  builder: (context, r, c) {
                    return Consumer(
                      builder: (context, re, c) {
                        final isLoading = re.watch(
                          loginNotifer.select((v) => v.loginState.isLoading),
                        );
                        return AbakonSendButton(
                          isLoading: isLoading,
                          isEnabled: r && !isLoading,
                          onTap: _login,
                          title: Strings.login,
                        );
                      },
                    );
                  },
                ),
                const VerticalSpacing(16),

                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: Strings.dontHaveAnAccount,
                          style: context.textTheme.s12w400
                              .copyWith(color: AppColors.primary010101),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushNamed(Login.routeName);
                                },
                              text: Strings.register,
                              style: context.textTheme.s12w900
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    final data = LoginRequest(
      password: _passwordController.text.trim(),
      email: _phoneNumberController.text.toLowerCase().trim(),
    );
    ref.read(loginNotifer.notifier).login(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            _isLoginEnabled.value = false;
            //context.replaceAll(Dashboard.routeName);
          },
        );
  }
}
