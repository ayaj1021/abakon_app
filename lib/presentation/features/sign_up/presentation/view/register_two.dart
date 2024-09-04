import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/features/dashboard/widgets/dashboard.dart';
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
  late TextEditingController _pinController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _stateController;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinController.dispose();
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
    _pinController = TextEditingController()..addListener(_validateInput);
  }

  _validateInput() {
    //ref.read(registerNotifier.notifier).allInputValid(
    if (Validators.password()(_passwordController.text) == null &&
        Validators.password()(_confirmPasswordController.text) == null &&
        _passwordController.text == _confirmPasswordController.text &&
        Validators.notEmpty()(_stateController.text) == null &&
        Validators.phone()(_pinController.text) == null) {
      //);
      return true;
    } else {
      return false;
    }
  }

  void _goToDashboard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Dashboard(),
      ),
    );
  }

  //   void _validateInput() {
  //   ref.read(registerNotifier.notifier).allInputValid(
  //         emailValid: Validators.email()(_emailAddressController.text) == null,
  //         passwordValid: Validators.password()(_passwordController.text) ==
  //                 null &&
  //             Validators.password()(_confirmPasswordController.text) == null &&
  //             _passwordController.text == _confirmPasswordController.text,
  //         nameValid: Validators.name()(_firstNamecontroller.text) == null &&
  //             Validators.name()(_lastNamecontroller.text) == null,
  //         usernameValid:
  //             Validators.notEmpty()(_usernamecontroller.text) == null,
  //         dateValid: Validators.date()(_phoneNumberController.text) == null,
  //       );
  // }

  void _signUp() {
    // print('xclusive@gmail.com'.redactedEmail);
    // ref.read(registerNotifier.notifier).signUp(
    //       data: SignUpRequest(
    //         email: _emailAddressController.text.toLowerCase().trim(),
    //         password: _passwordController.text,
    //         firstName: _firstNamecontroller.text,
    //         lastName: _lastNamecontroller.text.toLowerCase(),
    //         username: _usernamecontroller.text,
    //         //dateOfBirth: _datecontroller.text.split('/').reversed.join('-'),
    //         alipayQrCode: 'aaaaa',
    //         gender: '',
    //       ),
    //       onError: (error) {
    //         context.showError(message: error);
    //       },
    //       onSuccess: () {
    //         context.hideOverLay();
    //         // ..push(

    //         // );
    //       },
    //     );
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
                    pinController: _pinController,
                  ),
                  const VerticalSpacing(100),
                  Consumer(
                    builder: (context, r, c) {
                      // final isLoading = r.watch(
                      //   registerNotifier
                      //       .select((v) => v.registerState.isLoading),
                     // );
                      return AbakonSendButton(
                        isEnabled: _validateInput(),

//                         r.watch(
// _validateInput()

//                              // registerNotifier.select((v) => v.inputValid),
//                             ) &&
//                             !isLoading,
//                         isLoading: isLoading,
                        onTap: _goToDashboard,
                        //_signUp,
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
