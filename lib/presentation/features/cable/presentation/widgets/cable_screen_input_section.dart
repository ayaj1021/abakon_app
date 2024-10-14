
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/cable_provider_dropdown_widget.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/plan_dropdown_widget.dart';
import 'package:abakon/presentation/features/services/data/model/get_all_services_response.dart';
import 'package:abakon/presentation/features/services/notifier/get_all_services_notifier.dart';
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
  @override
  void initState() {
    // _phoneNumberController = TextEditingController()..addListener(_listener);
    //  _amountController = TextEditingController()..addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getAllServicesNotifierProvider.notifier).getAllServices();
    });

    super.initState();
  }

  String? _selectedCableProvider;
  String? _selectedCablePlan;

  List<CablePlan> filteredPlans = [];

  void _onCableProviderSelected(
      String selectedCableProvider, List<CablePlan> allPlans) {
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

  @override
  Widget build(BuildContext context) {
    final cablePlans = ref.watch(getAllServicesNotifierProvider.select(
        (v) => v.getAllServices.data?.data?.cablePlans?.toSet().toList()));
 
    return Column(
      children: [
        CableProviderDropDown(
          cablePlans: cablePlans ?? [],
          labelText: 'Select provider',
          selectedCableProvider: _selectedCableProvider,
          onCableProviderSelected: (selectedCableProvider) =>
              _onCableProviderSelected(
                  selectedCableProvider, cablePlans ?? []),
        ),
        const VerticalSpacing(16),
        CablePlansDown(
          labelText: 'Plan',
          filteredPlans: filteredPlans,
          onCablePlanSelected: _onCablePlanSelected,
          selectedCablePlan: _selectedCablePlan,
          selectedCableProvider: _selectedCableProvider,
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
      //  const VerticalSpacing(16),
        //const SubcriptionTypeSection(),
        const VerticalSpacing(16),
        TextField(
          decoration: InputDecoration(
            labelStyle: context.textTheme.s10w500.copyWith(
              color: AppColors.primary595857,
            ),
            labelText: 'Customer phone number',
            border: const OutlineInputBorder(),
          ),
        ),
        const VerticalSpacing(16),
        TextField(
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
              // showModalBottomSheet(
              //     context: context,
              //     builder: (context) {
              //       return const ConfirmCableTvSubscription();
              //     });
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
