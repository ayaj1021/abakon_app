
import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/resend_otp_request.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/verify_otp_request.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/verify_token_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPVerificationRepository {
  OTPVerificationRepository(this._restClient);

  final RestClient _restClient;

  Future<BaseResponse<VerifyTokenResponse>> validateSignUpOtp(
    VerifyOtpRequest req,
  ) async {
    try {
      final response = await _restClient.verifySignUpOtp(req);
      return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }



  Future<BaseResponse<dynamic>> resendOtp(
    ResendOtpRequest req,
  ) async {
    try {
      final response = await _restClient.resendOTP(req);
      return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final otpVerificationRepositoryProvider = Provider<OTPVerificationRepository>(
  (ref) => OTPVerificationRepository(
    ref.read(restClientProvider),
  ),
);
