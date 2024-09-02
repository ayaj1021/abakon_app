import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:abakon/presentation/features/sign_up/presentation/view/register_two.dart';
import 'package:abakon/presentation/features/sign_up/presentation/widgets/register_one_input_field_section.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterOne extends ConsumerStatefulWidget {
  const RegisterOne({super.key});

  static const routeName = '/registerOne';

  @override
  ConsumerState<RegisterOne> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<RegisterOne> {
  late TextEditingController _emailAddressController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _firstNamecontroller;
  late TextEditingController _lastNamecontroller;
  late TextEditingController _usernamecontroller;
  late TextEditingController _phoneNumberController;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNamecontroller.dispose();
    _lastNamecontroller.dispose();
    _usernamecontroller.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailAddressController = TextEditingController()
      ..addListener(_validateInput);
    _passwordController = TextEditingController()..addListener(_validateInput);
    _firstNamecontroller = TextEditingController()..addListener(_validateInput);
    _lastNamecontroller = TextEditingController()..addListener(_validateInput);
    _usernamecontroller = TextEditingController()..addListener(_validateInput);
    _phoneNumberController = TextEditingController()
      ..addListener(_validateInput);
    _confirmPasswordController = TextEditingController()
      ..addListener(_validateInput);
  }

  _validateInput() {
    if (Validators.email()(_emailAddressController.text) == null &&
        Validators.name()(_firstNamecontroller.text) == null &&
        Validators.name()(_lastNamecontroller.text) == null &&
        Validators.phone()(_phoneNumberController.text) == null) {
      return true;
    } else {
      return false;
    }
  }

  void _goToRegisterTwo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const RegisterTwo()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              onChanged: () => setState(() {}),
              child: Column(
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
                  const VerticalSpacing(8),
                  Text(
                    Strings.register,
                    style: context.textTheme.s20w900
                        .copyWith(color: AppColors.primary591E0C),
                  ),
                  const VerticalSpacing(8),
                  Text(
                    Strings.enterYourDetailsBelow,
                    style: context.textTheme.s12w400
                        .copyWith(color: AppColors.primary010101),
                  ),
                  const VerticalSpacing(45),
                  RegisterOneInputFieldSection(
                    firstNamecontroller: _firstNamecontroller,
                    lastNamecontroller: _lastNamecontroller,
                    phoneNumbercontroller: _phoneNumberController,
                    emailAddressController: _emailAddressController,
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  AbakonSendButton(
                    isEnabled: _validateInput(),
                    onTap: _goToRegisterTwo,
                    title: Strings.continueRegister,
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: Strings.alreadyHaveAnAccount,
                            style: context.textTheme.s12w400
                                .copyWith(color: AppColors.primary010101),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.pushNamed(Login.routeName);
                                  },
                                text: Strings.loginNow,
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
      ),
    );
  }
}
