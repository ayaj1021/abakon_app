import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/notifier/get_all_user_details_notifier.dart';
import 'package:abakon/presentation/features/dashboard/widgets/dashboard.dart';
import 'package:abakon/presentation/features/login/data/models/login_request.dart';
import 'package:abakon/presentation/features/login/presentation/notifier/login_notifier.dart';
import 'package:abakon/presentation/features/login/presentation/view/forgot_password.dart';
import 'package:abakon/presentation/features/login/presentation/widgets/login_input_section.dart';
import 'package:abakon/presentation/features/sign_up/presentation/view/register_one.dart';
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


  @override
  void initState() {
    _phoneNumberController = TextEditingController()..addListener(_listener);
    _passwordController = TextEditingController()..addListener(_listener);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getUserDetailsNotifierProvider.notifier)
          .getAllUserDetails();
    });
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
    final firstName = ref.watch(getUserDetailsNotifierProvider
        .select((v) => v.getAllDetails.data?.allDetails?.sFname));
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
                // GestureDetector(
                //   onTap: () => context.pop(),
                //   child: const Icon(
                //     Icons.arrow_back_ios,
                //     color: AppColors.primary591E0C,
                //   ),
                // ),
                Text(
                  Strings.welcome(firstName ?? ''),
                  style: context.textTheme.s20w900.copyWith(
                    color: AppColors.primary591E0C,
                  ),
                ),
                //email: ayaj1021+v@gmail.com, phone: 09123456703
                Text(
                  Strings.logInYourAccount,
                  style: context.textTheme.s12w400
                      .copyWith(color: AppColors.primary010101),
                ),
                const VerticalSpacing(30),
                LoginInputSection(
                  passwordController: _passwordController,
                  phoneNumberController: _phoneNumberController,
                ),
                GestureDetector(
                  onTap: () => 
                  
                  // forgotPasswordBottomSheet(
                  //   context: context,
                  //   emailAddressController: _emailAddressController,
                  // ),
                  context.pushNamed(ForgotPasswordView.routeName),
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
                          onTap: () => _login(),
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
                                  context.pushNamed(RegisterOne.routeName);
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
      phone: _phoneNumberController.text.trim(),
    );
    ref.read(loginNotifer.notifier).login(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isLoginEnabled.value = false;
            context.showSuccess(message: message);
            // log('Login successfull');
            context.replaceAll(Dashboard.routeName);
          },
        );
  }
}
