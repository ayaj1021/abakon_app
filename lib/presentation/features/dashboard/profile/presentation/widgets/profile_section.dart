import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/change_password/presentation/view/change_password_view.dart';
import 'package:abakon/presentation/features/change_transaction_pin/presentation/view/change_transaction_pin_view.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/notifier/delete_user_notifier.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/notifier/log_out_notifier.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/widgets/profile_widget.dart';
import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:abakon/presentation/features/my_information/presentation/view/my_information_page.dart';
import 'package:abakon/presentation/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:abakon/presentation/features/support/presentation/view/support_page.dart';
import 'package:abakon/presentation/features/transactions/presentation/view/transaction_view.dart';
import 'package:abakon/presentation/general_widgets/purchase_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSection extends ConsumerStatefulWidget {
  const ProfileSection({super.key});

  @override
  ConsumerState<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends ConsumerState<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    // ref.listen(profileNotifierProvider, (previous, next) {
    //   if (next.homeSessionState == HomeSessionState.logout) {
    //     context
    //       ..replaceNamed(
    //         Login.routeName,
    //       );

    //   }
    // });

    return Consumer(builder: (context, re, c) {
      final isLogOutLoading = re.watch(
        logOutNotifer.select((v) => v.logOut.isLoading),
      );
      return Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileWidget(
                  title: 'My Information',
                  onTap: () {
                    context.pushNamed(MyInformationPage.routeName);
                  },
                  icon: Icons.person,
                ),
                ProfileWidget(
                  title: 'My Tranactions',
                  onTap: () => context.pushNamed(TransactionView.routeName),
                  icon: Icons.swap_horiz_sharp,
                ),
                ProfileWidget(
                  title: 'Change Password',
                  onTap: () {
                    context.pushNamed(ChangePasswordView.routeName);
                  },
                  icon: Icons.lock_outline,
                ),
                ProfileWidget(
                  title: 'Change Transaction Pin',
                  onTap: () {
                    context.pushNamed(ChangeTransactionPinView.routeName);
                  },
                  icon: Icons.pin,
                ),
                ProfileWidget(
                  title: 'Support',
                  onTap: () {
                    context.pushNamed(SupportPage.routeName);
                  },
                  icon: Icons.support_agent_outlined,
                ),
                ProfileWidget(
                  title: 'Log out',
                  onTap: () {
                    showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return PurchaseBottomSheetWidget(
                            purchaseInfo: 'Are you sure you want to log out?',
                            onTap: () {
                              context.pop(context);
                              _logOut();
                            },
                          );
                        });
                  },
                  icon: Icons.logout,
                  iconColor: Colors.transparent,
                ),
                ProfileWidget(
                  title: 'Delete account',
                  textColor: AppColors.primaryColor,
                  icon: Icons.delete_forever_outlined,
                  iconColor: Colors.transparent,
                  onTap: () {
                    showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return PurchaseBottomSheetWidget(
                            purchaseInfo:
                                'Are you sure you want to delete your account?',
                            onTap: () {
                              context.pop(context);
                              _deleteAccount();
                            },
                          );
                        });
                  },
                ),
              ],
            ),
          ),
          isLogOutLoading
              ? Container(
                  alignment: Alignment.center,
                  //height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: AppColors.greyFill.withOpacity(0.2)),
                  child: const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      );
    });
  }

  void _logOut() {
    ref.read(logOutNotifer.notifier).logOut(
      onError: (error) {
        context.showError(message: error);
      },
      onSuccess: (message) {
        context.showSuccess(message: message);
        context.pushReplacementNamed(Login.routeName);
      },
    );
  }

  void _deleteAccount() {
    ref.read(deleteUserNotifer.notifier).deleteUser(
      onError: (error) {
        context.showError(message: error);
      },
      onSuccess: (message) {
        context.showSuccess(message: message);
        context.pushReplacementNamed(OnboardingScreen.routeName);
      },
    );
  }
}
