import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/buy_data_request.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/get_all_data_service_response.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/notifier/buy_data_notifier.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/notifier/get_all_data_services_notifier.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_network_dropdown_widget.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_plan_dropdown.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_text_field.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_type_dropdown_widget.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/confirm_transactions_widget.dart';
import 'package:abakon/presentation/general_widgets/purchase_bottom_sheet_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:abakon/presentation/general_widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataInputSection extends ConsumerStatefulWidget {
  const DataInputSection({super.key});

  @override
  ConsumerState<DataInputSection> createState() => _DataInputSectionState();
}

class _DataInputSectionState extends ConsumerState<DataInputSection> {
  final ValueNotifier<bool> _isBuyDataEnabled = ValueNotifier(false);
  late TextEditingController _phoneNumberController;
  final _pinController = TextEditingController();
  String? _selectedNetwork;
  String? _selectedType;
  String? _selectedPlan;
  String? _selectedPlanPrice;

  String? _selectedNid;
  String? _selectedDataId;
  @override
  void initState() {
    getUserPin();
    _phoneNumberController = TextEditingController()..addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getAllDataServicesNotifierProvider.notifier)
          .getAllDataServices();
    });

    super.initState();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _listener() {
    _isBuyDataEnabled.value = _selectedNetwork != null &&
        _selectedType != null &&
        _selectedPlan != null &&
        _phoneNumberController.text.isNotEmpty;
  }

  String _userPin = '';

  getUserPin() async {
    final pin = await SecureStorage().getUserPin();
    setState(() {
      _userPin = pin.toString();
    });
  }

  List<Plan> filteredPlans = [];

  // void _onDataProviderSelected(
  //     String selectedNetworkProvider, List<Plan> allPlans) {
  //   setState(() {
  //     _selectedNetwork = selectedNetworkProvider;
  //     filteredPlans =
  //         allPlans.where((plan) => plan.network == _selectedNetwork).toList();
  //     _selectedPlan = null;
  //     _selectedPlanPrice = null;
  //   });
  // }

  void _onDataProviderSelected(
      String selectedNetworkProvider, List<Plan> allPlans) {
    setState(() {
      _selectedNetwork = selectedNetworkProvider;
      _selectedType = null; // Reset type when network changes
      _selectedPlan = null; // Reset plan when network changes
      _selectedPlanPrice = null; // Reset price when network changes
      _updateFilteredPlans(
          allPlans); // Update filtered plans based on the new network
    });
  }

  void _onNidSelected(String selectedNid) {
    setState(() {
      _selectedNid = selectedNid;
    });
  }

  void _onDataIdSelected(String selectedDataId) {
    setState(() {
      _selectedDataId = selectedDataId;
    });
  }

  // void _onTypeSelected(String selectedNetwork) {
  //   setState(() {
  //     _selectedType = selectedNetwork;

  //     _selectedPlan = null;
  //     _selectedPlanPrice = null;
  //   });
  // }

  void _onTypeSelected(String selectedType, List<Plan>? dataPlans) {
    setState(() {
      _selectedType = selectedType;
      _selectedPlan = null; // Reset plan when type changes
      _selectedPlanPrice = null; // Reset price when type changes
      _updateFilteredPlans(
          dataPlans ?? []); // Update filtered plans based on the new type
    });
  }

  void _onPlanSelected(String selectedNetwork) {
    setState(() {
      _selectedPlan = selectedNetwork;
      _selectedPlanPrice = null;
    });
  }

  void _onPlanPriceSelected(String selectedPlanPrice) {
    setState(() {
      _selectedPlanPrice = selectedPlanPrice;
    });
  }

  void _updateFilteredPlans(List<Plan> allPlans) {
    filteredPlans = allPlans.where((plan) {
      final matchesNetwork =
          _selectedNetwork == null || plan.network == _selectedNetwork;
      final matchesType = _selectedType == null || plan.type == _selectedType;
      return matchesNetwork && matchesType;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final dataPlans = ref.watch(getAllDataServicesNotifierProvider
        .select((v) => v.getAllDataServices.data?.data?.toSet().toList()));

    final loadState = ref
        .watch(getAllDataServicesNotifierProvider.select((v) => v.loadState));

    return SizedBox(
        child: switch (loadState) {
      LoadState.loading => const Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        )),
      LoadState.error => const Center(child: Text('Error')),
      _ => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataNetWorkDropDown(
              dataPlans: dataPlans ?? [],
              selectedNetwork: _selectedNetwork,
              onNetworkSelected: (selectedCableProvider) =>
                  _onDataProviderSelected(
                      selectedCableProvider, dataPlans ?? []),

              //_onNetworkSelected,
              onNidSelected: _onNidSelected,
              selectedNid: int.tryParse(_selectedNid.toString()),
            ),
            const VerticalSpacing(16),
            DataTypeDropDown(
              dataPlans: dataPlans ?? [],
              selectedType: _selectedType,
              ontypeSelected: (selectedType) =>
                  _onTypeSelected(selectedType.toString(), dataPlans),
            ),
            const VerticalSpacing(16),
            // DataPlanDropDown(
            //   filteredPlans: filteredPlans,
            //   onPlanSelected: _onPlanSelected,
            //   selectedPlan: _selectedPlan,
            //   selectedNetwork: _selectedNetwork,
            //   selectedType: _selectedType,
            //   onDataIdSelected: _onDataIdSelected,
            //   selectedDataId: _selectedDataId,
            //   selectedPlanPrice: _selectedPlanPrice,
            //   onPlanPriceSelected: _onPlanPriceSelected,
            // ),

            DataPlanDropDown(
              filteredPlans: filteredPlans,
              onPlanSelected: _onPlanSelected,
              selectedPlan: _selectedPlan,
              selectedNetwork: _selectedNetwork,
              selectedType: _selectedType,
              onDataIdSelected: _onDataIdSelected,
              selectedDataId: _selectedDataId,
              selectedPlanPrice: _selectedPlanPrice,
              onPlanPriceSelected: _onPlanPriceSelected,
            ),
            const VerticalSpacing(16),
            // DataTextField(
            //   enable: false,
            //   labelText:  'N ${ _selectedPlanPrice ?? 'Amount to pay' }' ,
            //   controller: _phoneNumberController,
            // ),
            Text(
              'Amount',
              style: context.textTheme.s10w400.copyWith(
                color: AppColors.black,
              ),
            ),
            const VerticalSpacing(5),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.greyF1F1F1),
              child: Text(
                'N ${_selectedPlanPrice ?? ''}',
                style: context.textTheme.s14w500.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const VerticalSpacing(16),
            DataTextField(
              labelText: 'Phone Number',
              controller: _phoneNumberController,
            ),
            const VerticalSpacing(150),
            ValueListenableBuilder(
                valueListenable: _isBuyDataEnabled,
                builder: (context, r, c) {
                  return AbakonSendButton(
                      isEnabled: r,
                      onTap: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return PurchaseBottomSheetWidget(
                              onTap: () {
                                Navigator.pop(context);

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
                                            _buyData();
                                          }
                                        },
                                        pinController: _pinController,
                                        isEnabled:
                                            _pinController.text.isNotEmpty
                                                ? true
                                                : false,
                                      );
                                    });
                              },
                              purchaseInfo:
                                  'You are about to purchase an $_selectedNetwork airtime of $_selectedPlan for the phone number "${_phoneNumberController.text}"Do you wish to continue?',
                            );
                          },
                        );
                      },
                      title: 'Buy Data Bundle');
                })
          ],
        ),
    });
  }

  Future<dynamic> successAlertDialog(BuildContext context,
      {required Widget child}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: child,
      ),
    );
  }

  void _buyData() {
    final data = BuyDataRequest(
      phone: _phoneNumberController.text.toLowerCase().trim(),
      network: _selectedNid.toString(),
      portedNumber: 'true',
      dataPlan: _selectedDataId.toString(),
    );
    ref.read(buyDataNotifer.notifier).buyData(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isBuyDataEnabled.value = false;
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
