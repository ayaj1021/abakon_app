import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/home/data/repository/get_user_details_repository.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/notifier/get_all_user_details_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllUserDetailsNotifier
    extends AutoDisposeNotifier<GetAllUserDetailsState> {
  GetAllUserDetailsNotifier();

  late GetUserDetailsRepository _getUserDetailsRepository;

  @override
  GetAllUserDetailsState build() {
    _getUserDetailsRepository = ref.read(getUserDetailsRepositoryProvider);

    return GetAllUserDetailsState.initial();
  }

  Future<void> getAllUserDetails() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value = await _getUserDetailsRepository.getAllUserDetails();

      if (!value.status) throw value.msg.toException;


      state = state.copyWith(
          loadState: LoadState.idle,
          getAllDetails: AsyncResponse.success(value.data!));


      // state = state.copyWith(
      //     loadState: LoadState.idle,
      //     getAllDetails: GetAllUserDetailsResponse.fromJson(value.data));
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}


final getUserDetailsNotifierProvider =
    NotifierProvider.autoDispose<GetAllUserDetailsNotifier, GetAllUserDetailsState>(GetAllUserDetailsNotifier.new);


