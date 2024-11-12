import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/features/otp_validation/presentation/view/otp_verification.dart';
import 'package:abakon/presentation/features/sign_up/data/models/sign_up_request.dart';
import 'package:abakon/presentation/features/sign_up/presentation/notifier/register_notifier.dart';
import 'package:abakon/presentation/features/sign_up/presentation/widgets/register_two_input_field_section.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterTwo extends ConsumerStatefulWidget {
  const RegisterTwo({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  static const routeName = '/registerTwo';

  @override
  ConsumerState<RegisterTwo> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<RegisterTwo> {
  late TextEditingController _transactionPinController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _stateController;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _transactionPinController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _stateController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _stateController = TextEditingController()..addListener(_validateInput);
    _passwordController = TextEditingController()..addListener(_validateInput);
    _confirmPasswordController = TextEditingController()
      ..addListener(_validateInput);
    _transactionPinController = TextEditingController()
      ..addListener(_validateInput);
  }

  void _validateInput() {
    ref.read(registerNotifier.notifier).allInputValid(
          emailValid: Validators.email()(widget.email) == null,
          passwordValid: Validators.password()(_passwordController.text) ==
                  null &&
              Validators.password()(_confirmPasswordController.text) == null &&
              _passwordController.text == _confirmPasswordController.text,
          firstNameValid: Validators.name()(widget.firstName) == null,
          lastNameValid: Validators.notEmpty()(widget.lastName) == null,
          phoneNumberValid: Validators.phone()(widget.phoneNumber) == null,
          transactionPinValid:
              Validators.pin()(_transactionPinController.text) == null,
          stateValid: Validators.name()(_stateController.text) == null,
        );
  }

  void _signUp() {
    ref.read(registerNotifier.notifier).signUp(
          data: SignUpRequest(
            email: widget.email.trim(),
            password: _passwordController.text.trim(),
            firstname: widget.firstName.trim(),
            lastname: widget.lastName.trim(),
            phone: widget.phoneNumber.trim(),
            transpin: _transactionPinController.text.trim(),
            state: _stateController.text.trim(),
          ),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            context.hideOverLay();
            context.showSuccess(
                message: "Please check your email to activate your account");

            showModalBottomSheet<void>(
                // showDragHandle: true,

                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return OTPVerification(
                    email: widget.email,
                    // otpVerificationArgs: OtpVerificationArgs<LoginResponse>(
                    //   username: widget.email.toLowerCase(),
                    //   otpType: OtpType.email,
                    //   onCompleted: (LoginResponse data) {},
                    // onCompleted: (data) async {
                    //   final f = ref.read(registerNotifier.notifier);
                    //   await f.saveToken(data.tokens!);
                    //   await f.saveUser(data);
                    //   if (mounted) {
                    //     await context
                    //         .popAndPushNamed(TransactionPin.routeName);
                    //   }
                    // },
                    // ),
                  );
                });
          },
        );
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
                  RegisterTwoInputFieldSection(
                    statecontroller: _stateController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    pinController: _transactionPinController,
                  ),
                  const VerticalSpacing(80),
                  Consumer(
                    builder: (context, r, c) {
                      final isLoading = r.watch(
                        registerNotifier
                            .select((v) => v.registerState.isLoading),
                      );
                      return AbakonSendButton(
                        isEnabled: r.watch(
                              //_validateInput()

                              registerNotifier.select((v) => v.inputValid),
                            ) &&
                            !isLoading,
                        isLoading: isLoading,
                        onTap: _signUp,
                        title: Strings.register,
                      );
                    },
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
