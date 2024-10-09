import 'package:abakon/core/config/env/base_env.dart';
import 'package:abakon/core/config/env/prod_env.dart';
import 'package:abakon/core/config/interceptors/header_interceptor.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_request.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_response.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/buy_data_request.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/buy_data_response.dart';
import 'package:abakon/presentation/features/services/data/model/get_all_services_response.dart';
import 'package:abakon/presentation/features/dashboard/home/data/model/get_user_details_response.dart';
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

  @POST('/auth/register')
  Future<SignUpResponse> signUp(
    @Body() SignUpRequest signUpRequest,
  );

  @POST('/auth/login')
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequest,
  );

  @POST('/data')
  Future<BuyDataResponse> buyData(
    @Body() BuyDataRequest buyDataRequest,
  );


@POST('/airtime')
  Future<BuyAirtimeResponse> buyAirtime(
    @Body() BuyAirtimeRequest buyDataRequest,
  );


//   @POST('/auth/create-pin')
//   Future<BaseResponse<LoginResponse>> createPin(
//     @Body() CreatePinRequest loginRequest,
//   );

  @POST('/auth/recover')
  Future<dynamic> resendOTP(
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

  @POST('/auth/verify')
  Future<VerifyTokenResponse> verifySignUpOtp(
    @Body() VerifyOtpRequest request,
    // @Queries() Map<String, dynamic> queries,
  );

  @GET('/user')
  Future<GetAllUserDetailsResponse> getAllUserDetails(
      // @Queries() Map<String, dynamic> queries,
  );

  @GET('/settings')
  Future<GetAllServicesResponse> getAllServices(
      // @Queries() Map<String, dynamic> queries,
  );

  //       @GET('/user')
  // Future<GetAllUserDetailsResponse> getTransaction(
  //     // @Queries() Map<String, dynamic> queries,
  //     );

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
    dio.options.baseUrl = 'https://test.abakon.ng/api';
    // dio.options.baseUrl = 'https://abakon.onrender.com/api/users';

    dio.options.headers = {
      'Content-Type': 'application/json',

      // 'Authorization': 'Bearer ${ref.read(tokenProvider)}',
      // 'accept': 'application/json',
    };

    dio.interceptors.add(
      HeaderInterCeptor(
        dio: dio,
        secureStorage: ref.read(localStorageProvider),
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
