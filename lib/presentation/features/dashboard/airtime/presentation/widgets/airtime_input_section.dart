import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/disable_number_validator_widget.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_request.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/notifier/buy_airtime_notifier.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_text_field.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_network_dropdown_widget.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_type_dropdown_widget.dart';
import 'package:abakon/presentation/features/services/notifier/get_all_services_notifier.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/purchase_bottom_sheet_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AirtimeInputSection extends ConsumerStatefulWidget {
  const AirtimeInputSection({super.key});

  @override
  ConsumerState<AirtimeInputSection> createState() =>
      _AirtimeInputSectionState();
}

class _AirtimeInputSectionState extends ConsumerState<AirtimeInputSection> {
  final ValueNotifier<bool> _isBuyAirtimeEnabled = ValueNotifier(false);
  late TextEditingController _phoneNumberController;
  late TextEditingController _amountController;
  @override
  void initState() {
    _phoneNumberController = TextEditingController()..addListener(_listener);
    _amountController = TextEditingController()..addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getAllServicesNotifierProvider.notifier).getAllServices();
    });

    super.initState();
  }

  String? _selectedNetwork;
  String? _selectedType;
  String? _selectedNid;

  void _listener() {
    _phoneNumberController.text.isNotEmpty && _amountController.text.isNotEmpty;
  }

  void _onNetworkSelected(String selectedNetwork) {
    setState(() {
      _selectedNetwork = selectedNetwork;
    });
  }

  void _onNidSelected(String selectedNid) {
    setState(() {
      _selectedNid = selectedNid;
    });
  }

  void onTypeSelected(String selectedType) {
    setState(() {
      _selectedType = selectedType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final airtimePlans = ref.watch(getAllServicesNotifierProvider.select(
        (v) => v.getAllServices.data?.data?.airtimeDiscount?.toSet().toList()));
    return Consumer(builder: (context, re, c) {
      final isLoading = re.watch(
        buyAirtimeNotifer.select((v) => v.buyAirtimeState.isLoading),
      );
      return Stack(
        children: [
          Column(
            children: [
              AirtimeNetWorkDropDown(
                airtimePlans: airtimePlans ?? [],
                selectedNetwork: _selectedNetwork,
                onNetworkSelected: _onNetworkSelected,
                onNidSelected: _onNidSelected,
                selectedNid: int.tryParse(_selectedNid.toString()),
              ),
              const VerticalSpacing(16),
              AirtimeTypeDropDown(
                airtimePlans: airtimePlans ?? [],
                onTypeSelected: onTypeSelected,
                selectedType: _selectedType,
              ),
              const VerticalSpacing(16),
              AirtimeTextField(
                maxLength: 11,
                labelText: 'Phone number',
                controller: _phoneNumberController,
              ),
              const VerticalSpacing(16),
              AirtimeTextField(
                labelText: 'Amount to pay',
                controller: _amountController,
              ),
              const VerticalSpacing(16),
              const VerticalSpacing(197),
              const DisableNumberValidatorCheckbox(),
              const VerticalSpacing(12),
              AbakonSendButton(
                  onTap: () {
                    showModalBottomSheet<void>(
                        // showDragHandle: true,

                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return PurchaseBottomSheetWidget(
                              purchaseInfo:
                                  'You are about to purchase an $_selectedNetwork airtime of ${_amountController.text} for the phone number ${_phoneNumberController.text} Do you wish to continue?',
                              onTap: () {
                                Navigator.pop(context);
                                _buyAirtime();
                              });
                        });
                  },
                  title: 'Buy Airtime')
            ],
          ),
          isLoading
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
              : const SizedBox.shrink()
        ],
      );
    });
  }

  void _buyAirtime() {
    final data = BuyAirtimeRequest(
      phone: _phoneNumberController.text.toLowerCase().trim(),
      network: _selectedNid.toString(),
      //'2',
      //_selectedNetwork.toString(),
      portedNumber: 'false',
      amount: _amountController.text.trim(),
      airtimeType: _selectedType.toString(),
      // _selectedPlan.toString(),
      ref: 'string',
    );
    ref.read(buyAirtimeNotifer.notifier).buyAirtime(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isBuyAirtimeEnabled.value = false;
            context.showSuccess(message: 'Login Successful');
            // log('Login successfull');
            // context.pu(Dashboard.routeName);
          },
        );
  }
}
