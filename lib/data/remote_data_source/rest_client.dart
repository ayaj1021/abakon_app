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
import 'package:abakon/presentation/features/dashboard/profile/data/model/delete_user_response.dart';
import 'package:abakon/presentation/features/dashboard/profile/data/model/logout_response.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/notifier/log_out_notifier.dart';
import 'package:abakon/presentation/features/dashboard/reward/data/model/referral_link_response.dart';
import 'package:abakon/presentation/features/electricity/data/model/buy_electricity_request.dart';
import 'package:abakon/presentation/features/electricity/data/model/buy_electricity_response.dart';
import 'package:abakon/presentation/features/electricity/data/model/get_all_electricity_service_response.dart';
import 'package:abakon/presentation/features/electricity/data/model/verify_electricity_request.dart';
import 'package:abakon/presentation/features/electricity/data/model/verify_electricity_response.dart';
import 'package:abakon/presentation/features/exam_pin/data/model/buy_exam_request.dart';
import 'package:abakon/presentation/features/exam_pin/data/model/get_all_exam_data_response.dart';
import 'package:abakon/presentation/features/firebase_token/data/model/send_token_request.dart';
import 'package:abakon/presentation/features/firebase_token/data/model/send_token_response.dart';
import 'package:abakon/presentation/features/login/data/models/forgot_password_request.dart';
import 'package:abakon/presentation/features/login/data/models/forgot_password_response.dart';
import 'package:abakon/presentation/features/notification/data/model/notification_response.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/resend_otp_response.dart';
import 'package:abakon/presentation/features/reset_password/data/model/reset_password_request.dart';
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

import '../../presentation/features/reset_password/data/model/reset_password_response.dart';

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
    @Body() BuyAirtimeRequest buyAirtimeRequest,
  );

  @POST('/user/update-token')
  Future<SendTokenResponse> sendToken(
    @Body() SendTokenRequest sendTokenRequest,
  );

  @POST('/exam')
  Future<BuyAirtimeResponse> buyExam(
    @Body() BuyExamRequest buyExamRequest,
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

  @POST('/electricity')
  Future<BuyElectricityResponse> buyElectricity(
    @Body() BuyElectricityRequest buyyElectricityRequest,
  );
  //electricity

  @DELETE('/user/delete')
  Future<DeleteUserResponse> deleteUser(
      // @Body() DeleteUserRequest deleteUserRequest,
      );

  @POST('/auth/recover')
  Future<ResendOtpResponse> resendOTP(
    @Body() ResendOtpRequest request,
  );

  @POST('/auth/recover')
  Future<ForgotPasswordResponse> forgotPassword(
    @Body() ForgotPasswordRequest request,
  );

  @POST('/auth/update-password')
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest request,
  );

  @POST('/auth/verify')
  Future<VerifyTokenResponse> verifySignUpOtp(
    @Body() VerifyOtpRequest request,
    // @Queries() Map<String, dynamic> queries,
  );

  @POST('/user/logout')
  Future<LogoutResponse> logout(
      // @Body() VerifyOtpRequest request,
      // @Queries() Map<String, dynamic> queries,
      );

  // @DELETE('/user/delete')
  // Future<LogoutResponse> delete(
  //     // @Body() VerifyOtpRequest request,
  //     // @Queries() Map<String, dynamic> queries,
  //     );

  @GET('/user')
  Future<GetAllUserDetailsResponse> getAllUserDetails(
      // @Queries() Map<String, dynamic> queries,
      );

  @GET('/settings')
  Future<GetAllServicesResponse> getAllServices(
      // @Queries() Map<String, dynamic> queries,
      );

  @GET('/notification')
  Future<NotificationResponse> getAllNotifications(
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

  @GET('/user/refer')
  Future<ReferralResponse> getReferralLink(
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
        onTokenExpired: () async {
          // await ref.read(localStorageProvider).logout(partialLogout: true);
          await ref.read(logOutNotifer.notifier).expireLogOut();
          // ref.read(logOutNotifer.notifier).state = ActivityStatus.loggedOut;
        },
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
