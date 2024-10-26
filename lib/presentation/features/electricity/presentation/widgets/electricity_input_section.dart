import 'package:abakon/presentation/features/electricity/data/model/get_all_electricity_service_response.dart';
import 'package:abakon/presentation/features/electricity/presentation/notifier/get_all_electricity_service_notifier.dart';
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
        _amountController.text.isNotEmpty &&
        _meterNumberController.text.isNotEmpty;
  }

  void _onElectricityProviderSelected(
      String selectedElectricityProvider, List<ElectricityProvider> allPlans) {
    setState(() {
      _selectedElectricityProvider = selectedElectricityProvider;
      // filteredPlans = allPlans
      //     .where((plan) => plan.provider == _selectedCableProvider)
      //     .toList();
      // _selectedCablePlan = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final electricityPlans = ref.watch(
        getAllElectricityServiceNotifierProvider.select(
            (v) => v.getAllElectricityService.data?.data?.toSet().toList()));
    return Column(
      children: [
        ElectricityProviderDropDown(
          electricityPlans: electricityPlans ?? [],
          selectedElectricityProvider: _selectedElectricityProvider,
          onElectricityProviderSelected: (selectedElectricityProvider) =>
              _onElectricityProviderSelected(
                  selectedElectricityProvider, electricityPlans ?? []),
        ),
        const VerticalSpacing(16),
        const ElectricityMeterTypeDropDown(),
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
        AbakonSendButton(
            onTap: () {
              showModalBottomSheet<void>(
                  // showDragHandle: true,

                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return PurchaseBottomSheetWidget(
                      purchaseInfo:
                          'You are about to purchase an "MTN" airtime of "100" for the phone number "08039334477"Do you wish to continue?',
                      onTap: () {},
                    );
                  });
            },
            title: 'Continue')
      ],
    );
  }
}
