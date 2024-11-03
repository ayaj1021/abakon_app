import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/electricity/data/model/buy_electricity_request.dart';
import 'package:abakon/presentation/features/electricity/data/model/get_all_electricity_service_response.dart';
import 'package:abakon/presentation/features/electricity/data/model/verify_electricity_request.dart';
import 'package:abakon/presentation/features/electricity/presentation/notifier/buy_electricity_notifier.dart';
import 'package:abakon/presentation/features/electricity/presentation/notifier/get_all_electricity_service_notifier.dart';
import 'package:abakon/presentation/features/electricity/presentation/notifier/verify_electricity_notifier.dart';
import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_meter_type_dropdown.dart';
import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_provider_dropdown_widget.dart';
import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_text_field.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/purchase_bottom_sheet_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElectricityInputSection extends ConsumerStatefulWidget {
  const ElectricityInputSection({super.key});

  @override
  ConsumerState<ElectricityInputSection> createState() =>
      _ElectricityInputSectionState();
}

class _ElectricityInputSectionState
    extends ConsumerState<ElectricityInputSection> {
  final ValueNotifier<bool> _isVerifyElectricityEnabled = ValueNotifier(false);
  late TextEditingController _meterNumberController;
  late TextEditingController _amountController;
  late TextEditingController _phoneNumberController;

  String? _selectedElectricityProvider;
  String? _selectedElectricityProviderId;
  String? _selectedMeterType;

  @override
  void initState() {
    _meterNumberController = TextEditingController()..addListener(_listener);
    _amountController = TextEditingController()..addListener(_listener);
    _phoneNumberController = TextEditingController()..addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getAllElectricityServiceNotifierProvider.notifier)
          .getAllElectricityService();
    });

    super.initState();
  }

  void _listener() {
    _phoneNumberController.text.isNotEmpty &&
        _meterNumberController.text.isNotEmpty;
    _amountController.text.isNotEmpty;
  }

  void _onElectricityProviderSelected(
      String selectedElectricityProvider, List<ElectricityProvider> allPlans) {
    setState(() {
      _selectedElectricityProvider = selectedElectricityProvider;
    });
  }

  void _onElectricityProviderIdSelected(String selectedElectricityProviderId) {
    setState(() {
      _selectedElectricityProviderId = selectedElectricityProviderId;
    });
  }

  void _onSelectMeterType(String selectedMeterType) {
    setState(() {
      _selectedMeterType = selectedMeterType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loadState = ref.watch(
        getAllElectricityServiceNotifierProvider.select((v) => v.loadState));
    final electricityPlans = ref.watch(
        getAllElectricityServiceNotifierProvider.select(
            (v) => v.getAllElectricityService.data?.data?.toSet().toList()));
    return SizedBox(
        child: switch (loadState) {
      LoadState.loading => const Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        )),
      LoadState.error => const Text('Error'),
      _ => Consumer(builder: (context, re, c) {
          final isLoading = re.watch(
            verifyElectricityNotifer
                .select((v) => v.verifyElectricityState.isLoading),
          );
          return Stack(
            children: [
              Column(
                children: [
                  ElectricityProviderDropDown(
                    electricityPlans: electricityPlans ?? [],
                    selectedElectricityProvider: _selectedElectricityProvider,
                    onElectricityProviderSelected:
                        (selectedElectricityProvider) =>
                            _onElectricityProviderSelected(
                                selectedElectricityProvider,
                                electricityPlans ?? []),
                    selectedElectricityProviderId: int.tryParse(
                      _selectedElectricityProviderId.toString(),
                    ),
                    onElectricityProviderIdSelected:
                        _onElectricityProviderIdSelected,
                  ),
                  const VerticalSpacing(16),
                  ElectricityMeterTypeDropDown(
                    selectedMeterType: _selectedMeterType,
                    onMeterTypeSelected: _onSelectMeterType,
                  ),
                  const VerticalSpacing(16),
                  ElectricityTextField(
                    labelText: 'Meter Number',
                    controller: _meterNumberController,
                  ),
                  const VerticalSpacing(16),
                  ElectricityTextField(
                    labelText: 'Phone Number',
                    controller: _phoneNumberController,
                  ),
                  const VerticalSpacing(16),
                  ElectricityTextField(
                    labelText: 'Amount',
                    controller: _amountController,
                  ),
                  const VerticalSpacing(223),
                  ValueListenableBuilder(
                      valueListenable: _isVerifyElectricityEnabled,
                      builder: (context, r, c) {
                        return AbakonSendButton(
                            //  isEnabled: r,
                            onTap: () {
                              _verifyElectricity();
                              // showModalBottomSheet<void>(
                              //     // showDragHandle: true,

                              //     isScrollControlled: true,
                              //     context: context,
                              //     builder: (context) {
                              //       return PurchaseBottomSheetWidget(
                              //         purchaseInfo:
                              //             'You are about to purchase an "MTN" airtime of "100" for the phone number "08039334477"Do you wish to continue?',
                              //         onTap: () {},
                              //       );
                              //     });
                            },
                            title: 'Continue');
                      })
                ],
              ),
              isLoading
                  ? Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.greyFill.withOpacity(0.2)),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          );
        }),
    });
  }

  void _verifyElectricity() {
    final data = VerifyElectricityRequest(
        provider: _selectedElectricityProviderId.toString(),
        meternumber: _meterNumberController.text.trim(),
        metertype: _selectedMeterType.toString());
    ref.read(verifyElectricityNotifer.notifier).verifyElectricity(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isVerifyElectricityEnabled.value = false;

            context.showSuccess(message: message);
            showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return PurchaseBottomSheetWidget(
                    purchaseInfo:
                        'You are about to purchase an $_selectedElectricityProvider subscription of ${_amountController.text} for the phone number ${_meterNumberController.text} Do you wish to continue?',
                    onTap: () {
                      context.pop(context);
                      _buyElectricity();
                    },
                  );
                });
          },
        );
  }

  void _buyElectricity() {
    final data = BuyElectricityRequest(
        provider: _selectedElectricityProviderId.toString(),
        meternumber: _meterNumberController.text.trim(),
        metertype: _selectedMeterType.toString(),
        amount: _amountController.text.trim(),
        phone: _phoneNumberController.text.trim());
    ref.read(buyElectricityNotifer.notifier).buyElectricity(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isVerifyElectricityEnabled.value = false;

            context.showSuccess(message: message);
          },
        );
  }
}
