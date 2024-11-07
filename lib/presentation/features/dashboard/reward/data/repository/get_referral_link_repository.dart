import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/dashboard/reward/data/model/referral_link_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetReferralLinkServiceRepository {
  GetReferralLinkServiceRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<ReferralResponse>> getReferralLinkService() async {
    try {
      final res = await _restClient.getReferralLink();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getReferralLinkServiceRepositoryProvider =
    Provider<GetReferralLinkServiceRepository>(
  (ref) => GetReferralLinkServiceRepository(
    ref.read(restClientProvider),
  ),
);
