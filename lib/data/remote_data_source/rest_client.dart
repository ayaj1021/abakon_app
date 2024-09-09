import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/env/base_env.dart';
import 'package:abakon/core/config/env/prod_env.dart';
import 'package:abakon/core/config/interceptors/header_interceptor.dart';
import 'package:abakon/domain/repository/user_auth_repository.dart';
import 'package:abakon/presentation/features/login/data/models/login_request.dart';
import 'package:abakon/presentation/features/login/data/models/login_response.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/resend_otp_request.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/verify_otp_request.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/verify_token_response.dart';
import 'package:abakon/presentation/features/sign_up/data/models/sign_up_request.dart';
import 'package:abakon/presentation/features/sign_up/data/models/sign_up_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/register')
  Future<BaseResponse<SignUpResponse>> signUp(
    @Body() SignUpRequest signUpRequest,
  );

  @POST('/login')
  Future<BaseResponse<LoginResponse>> login(
    @Body() LoginRequest loginRequest,
  );
//   @POST('/auth/create-pin')
//   Future<BaseResponse<LoginResponse>> createPin(
//     @Body() CreatePinRequest loginRequest,
//   );

  @POST('/resendtoken')
  Future<BaseResponse<dynamic>> resendOTP(
    @Body() ResendOtpRequest request,
  );

//   @POST('/auth/verify-reset-otp')
//   Future<BaseResponse<VerifyResetPasswordOtpResponse>> verifyResetPasswordOtp(
//     @Body() ResetPasswordOtpRequest request,
//   );

//   @POST('/auth/reset-password')
//   Future<BaseResponse<ResetPasswordResponse>> resetPassword(
//     @Body() ResetPasswordRequest request,
//   );

  @POST('/activate')
  Future<BaseResponse<VerifyTokenResponse>> verifySignUpOtp(
    @Body() VerifyOtpRequest request,
    // @Queries() Map<String, dynamic> queries,
  );

//   @POST('/auth/update-password')
//   Future<BaseResponse<ChangePasswordResponse>> changePassword(
//     @Body() ChangePasswordRequest request,
//   );

//   @GET('/bills/providers/{name}')
//   Future<BaseResponse<List<BillPaymentProvider>>> getBillPaymentProviders(
//     @Path() String name,
//   );

//   @GET('/bills/packages/{providerId}')
//   Future<BaseResponse<List<ProviderPackage>>> getPackages(
//     @Path() String providerId,
//   );

//   @POST('/bills/pay')
//   Future<BaseResponse<BillPaymentResponse>> makeBillPayment(
//     @Body() MakeBillPaymentRequest body,
//   );

//   @POST('/auth/forgot-password')
//   Future<BaseResponse<dynamic>> forgotPassword(
//     @Body() ForgotPasswordRequest body,
//   );

//   @GET('/bills/verify-recipient/{providerId}/{recipient}')
//   Future<BaseResponse<LookupRecipientResponse>> lookupRecipient(
//     @Path() String providerId,
//     @Path() String recipient,
//   );

//   @GET('/transactions')
//   Future<BaseResponse<TransactionResponse>> getTransactions(
//     @Queries() Map<String, dynamic> queries,
//   );

//   @GET('/transactions/{id}')
//   Future<BaseResponse<SingleTransactionResponse>> getTransactionDetails({
//     @Path() required String id,
//   });

//   @POST('/auth/logout')
//   Future<BaseResponse<dynamic>> logout();

//   @GET('/currencies')
//   Future<BaseResponse<List<ExchangeCurrency>>> getCurrencies();

//   @GET('/wallet')
//   Future<BaseResponse<Wallet>> getWallet();

//   @POST('/verification/level-1')
//   Future<BaseResponse<dynamic>> levelOneVerification(
//     @Body() LevelOneVerfificationModel body,
//   );
// }
}

ProviderFamily<Dio, BaseEnv> _dio = Provider.family<Dio, BaseEnv>(
  (ref, env) {
    final dio = Dio();
    dio.options.baseUrl = 'https://abakon.onrender.com/api/users';
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'accept': 'application/json',
    };

    dio.interceptors.add(
      HeaderInterCeptor(
        dio: dio,
        authRepository: ref.read(userAuthRepositoryProvider),
        // onTokenExpired: () {
        //ref.read(logoutProvider.notifier).state = ActivityStatus.loggedOut;
        // },
      ),
    );
    return dio;
  },
);

final restClientProvider = Provider((_) {
  final env = switch (F.appFlavor) {
    Flavor.prod => ProdEnv(),
    // Flavor.staging => StagingEnv(),
    //Flavor.dev => DevEnv(),
  };
  return RestClient(_.read(_dio.call(env)));
});
