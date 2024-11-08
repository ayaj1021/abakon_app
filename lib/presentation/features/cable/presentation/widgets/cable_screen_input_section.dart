import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/cable/data/model/buy_cable_request.dart';
import 'package:abakon/presentation/features/cable/data/model/get_all_cable_data_response.dart';
import 'package:abakon/presentation/features/cable/data/model/verify_cable_request.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/buy_cable_notifier.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/get_all_cable_data_notifier.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/verify_cable_notifier.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/cable_provider_dropdown_widget.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/plan_dropdown_widget.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/purchase_bottom_sheet_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
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
  late TextEditingController _phoneNumberController;
  late TextEditingController _amountController;
  late TextEditingController _iucNumberController;
  @override
  void initState() {
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

  final ValueNotifier<bool> _isVerifyCableEnabled = ValueNotifier(false);
  void _listener() {
    _phoneNumberController.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _iucNumberController.text.isNotEmpty;
  }

  String? _selectedCableProvider;
  String? _selectedCablePlan;
  String? _selectedCableId;
  String? _selectedPlanId;

  List<CableData> filteredPlans = [];

  void _onCableProviderSelected(
      String selectedCableProvider, List<CableData> allPlans) {
    setState(() {
      _selectedCableProvider = selectedCableProvider;
      filteredPlans = allPlans
          .where((plan) => plan.provider == _selectedCableProvider)
          .toList();
      _selectedCablePlan = null;
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
      final isVerifyLoading = re.watch(
        verifyCableNotifer.select((v) => v.verifyCableState.isLoading),
      );
      final isBuyLoading = re.watch(
        buyCableNotifer.select((v) => v.buyCableState.isLoading),
      );

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
                    onPlanIdSelected: _onPlanIdSelected,
                  ),
                  const VerticalSpacing(16),
                  TextField(
                    decoration: InputDecoration(
                      labelStyle: context.textTheme.s10w500.copyWith(
                        color: AppColors.primary595857,
                      ),
                      labelText: 'Amount to pay',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const VerticalSpacing(16),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
                      counterText: '',
                      labelStyle: context.textTheme.s10w500.copyWith(
                        color: AppColors.primary595857,
                      ),
                      labelText: 'Customer phone number',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const VerticalSpacing(16),
                  TextField(
                    controller: _iucNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'IUC number',
                      labelStyle: context.textTheme.s10w500.copyWith(
                        color: AppColors.primary595857,
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const VerticalSpacing(223),
                  AbakonSendButton(
                      onTap: () {
                        _verifyCable();
                      },
                      title: 'Continue'),
                ],
              ),
          }),
          isVerifyLoading
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: AppColors.greyFill.withOpacity(0.2)),
                  child: const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : const SizedBox.shrink(),
          isBuyLoading
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
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
                      context.pop(context);
                      _buyCable();
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
          },
        );
  }
}
