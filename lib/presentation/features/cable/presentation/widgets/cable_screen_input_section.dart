import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/cable/data/model/buy_cable_request.dart';
import 'package:abakon/presentation/features/cable/data/model/get_all_cable_data_response.dart';
import 'package:abakon/presentation/features/cable/data/model/verify_cable_request.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/buy_cable_notifier.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/get_all_cable_data_notifier.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/verify_cable_notifier.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/cable_provider_dropdown_widget.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/cable_text_field.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/plan_dropdown_widget.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/confirm_transactions_widget.dart';
import 'package:abakon/presentation/general_widgets/purchase_bottom_sheet_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:abakon/presentation/general_widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CableScreenInputSection extends ConsumerStatefulWidget {
  const CableScreenInputSection({super.key});

  @override
  ConsumerState<CableScreenInputSection> createState() =>
      _CableScreenInputSectionState();
}

class _CableScreenInputSectionState
    extends ConsumerState<CableScreenInputSection> {
  final ValueNotifier<bool> _isVerifyCableEnabled = ValueNotifier(false);
  late TextEditingController _phoneNumberController;
  late TextEditingController _amountController;
  late TextEditingController _iucNumberController;

  final _pinController = TextEditingController();
  @override
  void initState() {
    getUserPin();
    _phoneNumberController = TextEditingController()..addListener(_listener);
    _amountController = TextEditingController()..addListener(_listener);
    _iucNumberController = TextEditingController()..addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getAllCableDataNotifierProvider.notifier)
          .getAllCableData();
    });

    super.initState();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _phoneNumberController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  String _userPin = '';

  getUserPin() async {
    final pin = await SecureStorage().getUserPin();
    setState(() {
      _userPin = pin.toString();
    });
  }

  void _listener() {
    _isVerifyCableEnabled.value = _phoneNumberController.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _iucNumberController.text.isNotEmpty;
  }

  String? _selectedCableProvider;
  String? _selectedCablePlan;
  String? _selectedCableId;
  String? _selectedPlanId;
  String? _selectedPlanPrice;

  List<CableData> filteredPlans = [];

  void _onCableProviderSelected(
      String selectedCableProvider, List<CableData> allPlans) {
    setState(() {
      _selectedCableProvider = selectedCableProvider;
      filteredPlans = allPlans
          .where((plan) => plan.provider == _selectedCableProvider)
          .toList();
      _selectedCablePlan = null;
      _selectedPlanPrice = null;
    });
  }

  void _onCablePlanSelected(String selectedCablePlan) {
    setState(() {
      _selectedCablePlan = selectedCablePlan;
    });
  }

  void _onPlanIdSelected(String selectedPlanId) {
    setState(() {
      _selectedPlanId = selectedPlanId;
    });
  }

  void _onPlanPriceSelected(String selectedPlanPrice) {
    setState(() {
      _selectedPlanPrice = selectedPlanPrice;
    });
  }

  void _onCableIdSelected(String selectedCableId) {
    setState(() {
      _selectedCableId = selectedCableId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cablePlans = ref.watch(getAllCableDataNotifierProvider
        .select((v) => v.getAllCableData.data?.data?.toSet().toList()));
    final loadState =
        ref.watch(getAllCableDataNotifierProvider.select((v) => v.loadState));
    return Consumer(builder: (context, re, c) {
      return Stack(
        children: [
          SizedBox(
              child: switch (loadState) {
            LoadState.loading => const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              )),
            LoadState.error => const Center(child: Text('Error')),
            _ => Column(
                children: [
                  CableProviderDropDown(
                    cablePlans: cablePlans ?? [],
                    labelText: 'Select provider',
                    selectedCableProvider: _selectedCableProvider,
                    onCableProviderSelected: (selectedCableProvider) =>
                        _onCableProviderSelected(
                            selectedCableProvider, cablePlans ?? []),
                    selectedCableId: int.tryParse(_selectedCableId.toString()),
                    // _selectedCableId,
                    onCableIdSelected: _onCableIdSelected,
                  ),
                  const VerticalSpacing(16),
                  CablePlansDown(
                    labelText: 'Plan',
                    filteredPlans: filteredPlans,
                    onCablePlanSelected: _onCablePlanSelected,
                    selectedCablePlan: _selectedCablePlan,
                    selectedCableProvider: _selectedCableProvider,
                    selectedPlanId: int.tryParse(
                      _selectedPlanId.toString(),
                    ),
                    selectedPlanPrice: _selectedPlanPrice,
                    onPlanIdSelected: _onPlanIdSelected,
                    onPlanPriceSelected: _onPlanPriceSelected,
                  ),
                  const VerticalSpacing(16),
                  TextField(
                    keyboardType: TextInputType.number,
                    enabled: false,
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelStyle: context.textTheme.s10w500.copyWith(
                        color: AppColors.primary595857,
                      ),
                      labelText: 'N ${_selectedPlanPrice ?? 'Amount to pay'}',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const VerticalSpacing(16),
                  CableTextField(
                    labelText: 'Customer phone number',
                    maxLength: 11,
                    controller: _phoneNumberController,
                  ),
                  const VerticalSpacing(16),
                  CableTextField(
                    labelText: 'IUC number',
                    maxLength: 25,
                    controller: _iucNumberController,
                  ),

                  const VerticalSpacing(223),
                  // ValueListenableBuilder(
                  //     valueListenable: _isVerifyCableEnabled,
                  //     builder: (context, r, c) {
                  //  return
                  AbakonSendButton(
                      // isEnabled: r,
                      onTap: () {
                        _verifyCable();
                      },
                      title: 'Continue'),
                  // }),
                ],
              ),
          }),
        ],
      );
    });
  }

  void _verifyCable() {
    final data = VerifyCableRequest(
      smartCardNumber: _iucNumberController.text,
      cablename: "$_selectedCableId",
    );
    ref.read(verifyCableNotifer.notifier).verifyCable(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isVerifyCableEnabled.value = false;

            context.showSuccess(message: "IUC number verified, ");
            showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return PurchaseBottomSheetWidget(
                    purchaseInfo:
                        'You are about to purchase an $_selectedCableProvider subscription of ${_amountController.text} for the phone number ${_iucNumberController.text} Do you wish to continue?',
                    onTap: () {
                      showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return ConfirmTransactionsWidget(
                              onTap: () {
                                if (_pinController.text != _userPin) {
                                  context.showError(
                                      message: 'Pin is incorrect');
                                  return;
                                } else {
                                  Navigator.pop(context);
                                  _pinController.clear();
                                  _buyCable();
                                }
                              },
                              pinController: _pinController,
                              isEnabled:
                                  _pinController.text.isNotEmpty ? true : false,
                            );
                          });
                    },
                  );
                });
          },
        );
  }

  void _buyCable() {
    final data = BuyCableRequest(
      iucNumber: _iucNumberController.text.trim(),
      cableName: "$_selectedCableId",
      phone: _phoneNumberController.text.trim(),
      cablePlan: '$_selectedPlanId',
      subtype: '',
    );
    ref.read(buyCableNotifer.notifier).buyCable(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isVerifyCableEnabled.value = false;

            context.showSuccess(message: message);

            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: SuccessWidget(),
                  );
                });
          },
        );
  }
}
