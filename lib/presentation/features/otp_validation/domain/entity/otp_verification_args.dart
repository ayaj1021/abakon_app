

import 'package:abakon/core/utils/enums.dart';

class OtpVerificationArgs<T> {
  OtpVerificationArgs({
    required this.username,
    required this.otpType,
     this.onCompleted,
  });
  final String username;
  final OtpType otpType;
  final void Function(T data)? onCompleted;
}
