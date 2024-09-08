import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/features/dashboard/widgets/dashboard.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/verify_otp_request.dart';
import 'package:abakon/presentation/features/otp_validation/presentation/notifier/otp_notifier.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/countdown_timer.dart';
import 'package:abakon/presentation/general_widgets/digit_send_otp_field.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPVerification<T> extends ConsumerStatefulWidget {
  const OTPVerification({required this.email, super.key});

  final String email;

  // static const routeName = '/otp-verification';
  //final OtpVerificationArgs<T> otpVerificationArgs;
  @override
  ConsumerState<OTPVerification<T>> createState() => _OTPVerificationState<T>();
}

class _OTPVerificationState<T> extends ConsumerState<OTPVerification<T>> {
  final _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        // ref.read(
        //   verificationNotifier.notifier,
        // );
      },
    );

    _otpController.addListener(
      () {
        if (_otpController.text.length == 4) {}
      },
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _validateOtp() {
    ref.read(otpVerificationNotifierProvider.notifier).verifyOtp(
          request: VerifyOtpRequest(
            otp: _otpController.text,
          ),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            context.pushReplacementNamed(Dashboard.routeName);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(otpVerificationNotifierProvider.notifier);
    final state = ref.watch(otpVerificationNotifierProvider);
    return Container(
      height: 400.h,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.primaryF3E5CC,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.verifyYouAreTheOne,
            style: context.textTheme.s20w600
                .copyWith(color: AppColors.primary591E0C),
          ),
          const VerticalSpacing(13),
          Text(
            Strings.enterVerificationCodeSub(
              widget.email,
              // widget.otpVerificationArgs.otpType == OtpType.email
              //     ? widget.otpVerificationArgs.username.redactedEmail
              //     : widget.otpVerificationArgs.username,
            ),
            style: context.textTheme.s14w400.copyWith(
              color: AppColors.primary433C65,
            ),
          ),
          const VerticalSpacing(47),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AbakonSendOtpField(
              length: 4,
              controller: _otpController,
              
            ),
          ),

          const VerticalSpacing(35),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.resend,
                style: context.textTheme.s14w700.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              CountDownTimer(
                startTimer:
                    ref.watch(otpVerificationNotifierProvider).timerRunning,
                onTimerEnd: notifier.stopTimer,
              ),
            ],
          ),
          // Center(
          //   child: RichText(
          //     text: TextSpan(
          //       text: '${Strings.didNotReceiveCode} ',
          //       style: context.textTheme.s14w400.copyWith(
          //         color: AppColors.primarysWatch.shade600,
          //       ),
          //       children: [
          //         TextSpan(
          //           text: Strings.resend,
          //           style: context.textTheme.s14w700.copyWith(
          //             color: AppColors.primaryColor,
          //           ),
          //           // recognizer: TapGestureRecognizer()
          //           //   ..onTap = state.timerRunning
          //           //       ? null
          //           //       : () {
          //           //           notifier.resendOtp(
          //           //             request: ResendOtpRequest(
          //           //               email:
          //           //                   widget.otpVerificationArgs.username,
          //           //             ),
          //           //             onError: (error) {
          //           //               context.showError(message: error);
          //           //             },
          //           //           );
          //           //         },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const VerticalSpacing(27),
          Consumer(builder: (context, r, c) {
            final isLoading = r.watch(
              otpVerificationNotifierProvider
                  .select((v) => v.verificationState.isLoading),
            );
            return AbakonSendButton(
              // isEnabled: r.watch(
              //       otpVerificationNotifierProvider.select((v) => v.inputValid),
              //     ) &&
              //     !isLoading,
              isLoading: isLoading,
              onTap: _validateOtp,
              title: 'Verify Account',
            );
          })
        ],
      ),
    );
  }
}
