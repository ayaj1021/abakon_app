import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_request.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/notifier/buy_airtime_notifier.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/notifier/get_all_airtime_service_notifier.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_text_field.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_network_dropdown_widget.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_type_dropdown_widget.dart';
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
      await ref
          .read(getAllAirtimeServicesNotifierProvider.notifier)
          .getAllAirtimeServices();
    });

    super.initState();
  }

  String _networkProvider = '';

  void _updateNetworkProvider() {
    setState(() {
      _networkProvider = getNetworkProvider(_phoneNumberController.text);
    });
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
    final airtimePlans = ref.watch(getAllAirtimeServicesNotifierProvider
        .select((v) => v.getAllAirtimeServices.data?.data?.toSet().toList()));
    final loadState = ref.watch(
        getAllAirtimeServicesNotifierProvider.select((v) => v.loadState));
    return Consumer(builder: (context, re, c) {
      final isLoading = re.watch(
        buyAirtimeNotifer.select((v) => v.buyAirtimeState.isLoading),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    onChanged: (value) => _updateNetworkProvider(),
                  ),
                  const VerticalSpacing(5),
                  _phoneNumberController.text.isNotEmpty
                      ? Text(
                          'Network Provider: $_networkProvider',
                          style: context.textTheme.s10w400.copyWith(
                            color: AppColors.black,
                          ),
                        )
                      : const SizedBox.shrink(),
                  const VerticalSpacing(16),
                  AirtimeTextField(
                    labelText: 'Amount to pay',
                    controller: _amountController,
                  ),
                  const VerticalSpacing(16),
                  const VerticalSpacing(197),
                  // const DisableNumberValidatorCheckbox(),
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
          }),
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
      portedNumber: 'false',
      amount: _amountController.text.trim(),
      airtimeType: _selectedType.toString(),
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
          },
        );
  }
}

Map<String, String> networkPrefixes = {
  // 0803, 0806, 0810, 0813, 0814, 0816, 0903, 0906, 0913, and 0916
  '0803': 'MTN',
  '0806': 'MTN',
  '0703': 'MTN',
  '0706': 'MTN',
  '0813': 'MTN',
  '0810': 'MTN',
  '0814': 'MTN',
  '0816': 'MTN',
  '0903': 'MTN',
  '0906': 'MTN',
  '07025': 'MTN',
  '07026': 'MTN',
  '0704': 'MTN',
  '0805': 'Glo',
  '0807': 'Glo',
  '0705': 'Glo',
  '0811': 'Glo',
  '0815': 'Glo',
  '0905': 'Glo',
  '0915': 'Glo',
  '0802': 'Airtel',
  '0808': 'Airtel',
  '0708': 'Airtel',
  '0812': 'Airtel',
  '0902': 'Airtel',
  '0907': 'Airtel',
  '0901': 'Airtel',
  '0809': '9mobile',
  '0817': '9mobile',
  '0818': '9mobile',
  '0908': '9mobile',
  '0909': '9mobile',
};

String getNetworkProvider(String phoneNumber) {
  // Remove any non-numeric characters for cleaner matching
  phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

  // Check if the phone number starts with the Nigerian country code +234
  if (phoneNumber.startsWith('234')) {
    phoneNumber =
        '0${phoneNumber.substring(3)}'; // Convert +234 format to 0-based format
  }

  // Check for known prefixes
  for (String prefix in networkPrefixes.keys) {
    if (phoneNumber.startsWith(prefix)) {
      return networkPrefixes[prefix]!;
    }
  }
  return '';
 // return 'Unknown Network';
}
