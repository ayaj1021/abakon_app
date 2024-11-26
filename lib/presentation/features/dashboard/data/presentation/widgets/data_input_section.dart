import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/buy_data_request.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/notifier/buy_data_notifier.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/notifier/get_all_data_services_notifier.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_network_dropdown_widget.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_plan_dropdown.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_text_field.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_type_dropdown_widget.dart';
import 'package:abakon/presentation/features/services/data/model/get_all_services_response.dart';
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

  List<DataPlan> filteredPlans = [];
  void _onNetworkSelected(String selectedNetwork) {
    setState(() {
      _selectedNetwork = selectedNetwork; // This updates the selected network
      _selectedType = null; // Reset type and name when network changes
      _selectedPlan = null;
      _selectedPlanPrice = null;
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

  void _onTypeSelected(String selectedNetwork) {
    setState(() {
      _selectedType = selectedNetwork;

      _selectedPlan = null;
    });
  }

  void _onPlanSelected(String selectedNetwork) {
    setState(() {
      _selectedPlan = selectedNetwork;
    });
  }

  void _onPlanPriceSelected(String selectedPlanPrice) {
    setState(() {
      _selectedPlanPrice = selectedPlanPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataPlans = ref.watch(getAllDataServicesNotifierProvider
        .select((v) => v.getAllDataServices.data?.data?.toSet().toList()));

    final loadState = ref
        .watch(getAllDataServicesNotifierProvider.select((v) => v.loadState));
    return Consumer(
      builder: (context, re, c) {
        final isLoading = re.watch(
          buyDataNotifer.select((v) => v.buyDataState.isLoading),
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
                    DataNetWorkDropDown(
                      dataPlans: dataPlans ?? [],
                      selectedNetwork: _selectedNetwork,
                      onNetworkSelected: _onNetworkSelected,
                      onNidSelected: _onNidSelected,
                      selectedNid: int.tryParse(_selectedNid.toString()),
                    ),
                    const VerticalSpacing(16),
                    DataTypeDropDown(
                      dataPlans: dataPlans ?? [],
                      selectedType: _selectedType,
                      ontypeSelected: _onTypeSelected,
                    ),
                    const VerticalSpacing(16),
                    DataPlanDropDown(
                      dataPlans: dataPlans ?? [],
                      onPlanSelected: _onPlanSelected,
                      selectedPlan: _selectedPlan,
                      selectedNetwork: _selectedNetwork,
                      selectedType: _selectedType,
                      onDataIdSelected: _onDataIdSelected,
                      selectedDataId: _selectedDataId,
                      selectedPlanPrice: _selectedPlanPrice,
                      onPlanPriceSelected: _onPlanPriceSelected,
                      //int.tryParse(_selectedDataId.toString()),
                    ),
                    const VerticalSpacing(16),
                    DataTextField(
                      enable: false,
                      labelText:  'N ${ _selectedPlanPrice ?? 'Amount to pay' }' ,
                      controller: _phoneNumberController,
                    ),
                    const VerticalSpacing(16),
                    DataTextField(
                      labelText: 'Phone Number',
                      controller: _phoneNumberController,
                    ),
                    const VerticalSpacing(300),
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
                                                  if (_pinController.text !=
                                                      _userPin) {
                                                    context.showError(
                                                        message:
                                                            'Pin is incorrect');
                                                    return;
                                                  } else {
                                                    Navigator.pop(context);
                                                    _pinController.clear();
                                                    _buyData();
                                                  }
                                                },
                                                pinController: _pinController,
                                                isEnabled: _pinController
                                                        .text.isNotEmpty
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
            }),
            isLoading
                ? Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.greyFill.withOpacity(0.2)),
                    child: const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        );
      },
    );
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
