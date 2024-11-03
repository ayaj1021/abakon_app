import 'package:abakon/core/config/env/base_env.dart';
import 'package:abakon/core/config/env/prod_env.dart';
import 'package:abakon/core/config/interceptors/header_interceptor.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/cable/data/model/buy_cable_request.dart';
import 'package:abakon/presentation/features/cable/data/model/buy_cable_response.dart';
import 'package:abakon/presentation/features/cable/data/model/get_all_cable_data_response.dart';
import 'package:abakon/presentation/features/cable/data/model/verify_cable_request.dart';
import 'package:abakon/presentation/features/cable/data/model/verify_cable_response.dart';
import 'package:abakon/presentation/features/change_password/data/model/change_password_request.dart';
import 'package:abakon/presentation/features/change_password/data/model/change_password_response.dart';
import 'package:abakon/presentation/features/change_transaction_pin/data/model/change_transaction_pin_request.dart';
import 'package:abakon/presentation/features/change_transaction_pin/data/model/change_transaction_pin_response.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_request.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_response.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/get_all_airtime_service_response.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/buy_data_request.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/buy_data_response.dart';
import 'package:abakon/presentation/features/bank_deposits/data/model/generate_account_response.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/get_all_data_service_response.dart';
import 'package:abakon/presentation/features/dashboard/profile/data/model/delete_user_request.dart';
import 'package:abakon/presentation/features/electricity/data/model/get_all_electricity_service_response.dart';
import 'package:abakon/presentation/features/electricity/data/model/verify_electricity_request.dart';
import 'package:abakon/presentation/features/electricity/data/model/verify_electricity_response.dart';
import 'package:abakon/presentation/features/exam_pin/data/model/get_all_exam_data_response.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/resend_otp_response.dart';
import 'package:abakon/presentation/features/services/data/model/get_all_services_response.dart';
import 'package:abakon/presentation/features/dashboard/home/data/model/get_user_details_response.dart';
import 'package:abakon/presentation/features/login/data/models/login_request.dart';
import 'package:abakon/presentation/features/login/data/models/login_response.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/resend_otp_request.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/verify_otp_request.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/verify_token_response.dart';
import 'package:abakon/presentation/features/sign_up/data/models/sign_up_request.dart';
import 'package:abakon/presentation/features/sign_up/data/models/sign_up_response.dart';
import 'package:abakon/presentation/features/transactions/data/model/get_all_transactions_response.dart';
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

  @POST('/user/change-password')
  Future<ChangePasswordResponse> changePassword(
    @Body() ChangePasswordRequest changePasswordRequest,
  );

  @POST('/user/change-pin')
  Future<ChangeTransactionPinResponse> changeTransactionPin(
    @Body() ChangeTransactionPinRequest changeTransactionPinRequest,
  );


  @POST('/data')
  Future<BuyDataResponse> buyData(
    @Body() BuyDataRequest buyDataRequest,
  );

  @POST('/airtime')
  Future<BuyAirtimeResponse> buyAirtime(
    @Body() BuyAirtimeRequest buyDataRequest,
  );

  @POST('/cabletv/verify')
  Future<VerifyCableResponse> verifyCable(
    @Body() VerifyCableRequest verifyCableRequest,
  );

  @POST('/cabletv')
  Future<BuyCableResponse> buyCable(
    @Body() BuyCableRequest buyCableRequest,
  );

  @POST('/electricity/verify')
  Future<VerifyElectricityResponse> verifyElectricity(
    @Body() VerifyElectricityRequest verifyElectricityRequest,
  );

  @POST('/user/delete')
  Future<LoginResponse> deleteUser(
    @Body() DeleteUserRequest deleteUserRequest,
  );

  @POST('/auth/recover')
  Future<ResendOtpResponse> resendOTP(
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

  @GET('/settings?setting=data_plans')
  Future<DataResponse> getAllDataServices(
      // @Queries() Map<String, dynamic> queries,
      );
  @GET('/settings?setting=airtime_details')
  Future<AirtimeResponse> getAllAirtimeServices(
      // @Queries() Map<String, dynamic> queries,
      );

  @GET('/settings?setting=exam_plans')
  Future<GetAllExamData> getAllExamData(
      // @Queries() Map<String, dynamic> queries,
      );

  @GET('/settings?setting=electricity_settings')
  Future<ElectricityResponse> getAllElectricityService(
      // @Queries() Map<String, dynamic> queries,
      );

  @GET('/settings?setting=cable_plans')
  Future<GetAllCableData> getAllCableData(
      // @Queries() Map<String, dynamic> queries,
      );

  @GET('/user/payvessel')
  Future<GenerateAccountResponse> generateAccount(
      // @Queries() Map<String, dynamic> queries,
      );

  @GET('/transactions')
  Future<GetAllTransactionsResponse> getAllTransactions(
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

//   @GET('/bills/packages/{providerId}')
//   Future<BaseResponse<List<ProviderPackage>>> getPackages(
//     @Path() String providerId,
//   );

//   @POST('/auth/forgot-password')
//   Future<BaseResponse<dynamic>> forgotPassword(
//     @Body() ForgotPasswordRequest body,
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
    dio.options.baseUrl = 'https://api.abakon.ng/api';
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
