import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/exam_pin/data/model/buy_exam_request.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/notifier/buy_exam_notifier.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/notifier/get_all_exam_data_notifier.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_provider_dropdown_widget.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_text_field.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/confirm_transactions_widget.dart';
import 'package:abakon/presentation/general_widgets/purchase_bottom_sheet_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:abakon/presentation/general_widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamPinInputSection extends ConsumerStatefulWidget {
  const ExamPinInputSection({super.key});

  @override
  ConsumerState<ExamPinInputSection> createState() =>
      _ExamPinInputSectionState();
}

class _ExamPinInputSectionState extends ConsumerState<ExamPinInputSection> {
  final ValueNotifier<bool> _isBuyExamEnabled = ValueNotifier(false);
  late TextEditingController _quantityController;
  final _pinController = TextEditingController();
  //late TextEditingController _quantityController;
  @override
  void initState() {
    getUserPin();
    _quantityController = TextEditingController()..addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getAllExamDataNotifierProvider.notifier).getAllExamData();
    });

    super.initState();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _listener() {
    _isBuyExamEnabled.value =
        _selectedProvider != null && _quantityController.text.isNotEmpty;
  }

  String _userPin = '';
  getUserPin() async {
    final pin = await SecureStorage().getUserPin();
    setState(() {
      _userPin = pin.toString();
    });
  }

  String? _selectedEid;
  num? _selectedEPrice;

  String? _selectedProvider;
  num? totalPrice;
  //09165745128

  void _onProviderSelected(String selectedProvider) {
    setState(() {
      _selectedProvider = selectedProvider; // This updates the selected network
      totalPrice = null;
      _selectedEPrice = null;
    });
  }

  void _onEidSelected(String selectedEid) {
    setState(() {
      _selectedEid = selectedEid;
    });
  }

  void _onEPriceSelected(num selectedEPrice) {
    setState(() {
      _selectedEPrice = selectedEPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final examPlans = ref.watch(getAllExamDataNotifierProvider
        .select((v) => v.getAllExamData.data?.data?.toSet().toList()));
    final loadState =
        ref.watch(getAllExamDataNotifierProvider.select((v) => v.loadState));
    return Consumer(builder: (context, re, c) {
      final isLoading = re.watch(
        buyExamNotifer.select((v) => v.buyExamState.isLoading),
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
                  ExamPinProviderDropDown(
                    examPlans: examPlans ?? [],
                    selectedEid: int.tryParse(_selectedEid.toString()),
                    selectedProvider: _selectedProvider,
                    onNetworkSelected: _onProviderSelected,
                    onEidSelected: _onEidSelected,
                    selectedEPrice: num.tryParse(_selectedEPrice.toString()),
                    onEPriceSelected: _onEPriceSelected,
                  ),
                  const VerticalSpacing(16),
                  ExamPinTextField(
                    labelText: 'Quantity',
                    controller: _quantityController,
                    onChanged: (p0) {
                      setState(() {
                        totalPrice = _selectedEPrice! *
                            int.parse(_quantityController.text);
                      });
                    },
                  ),
                  const VerticalSpacing(16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                        color: AppColors.greyFill,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "N ${totalPrice ?? _selectedEPrice ?? 0}",
                    ),
                  ),
                  const VerticalSpacing(223),
                  ValueListenableBuilder(
                      valueListenable: _isBuyExamEnabled,
                      builder: (context, r, c) {
                        return AbakonSendButton(
                          isEnabled: r,
                          onTap: () {
                            showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return PurchaseBottomSheetWidget(
                                    purchaseInfo:
                                        'You are about to purchase an $_selectedProvider pin purchase of  of $totalPrice. Do you wish to continue?',
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
                                                  _buyExam();
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
                                  );
                                });
                          },
                          title: 'Continue',
                        );
                      }),
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

  void _buyExam() {
    final data = BuyExamRequest(
      provider: _selectedEid.toString(),
      portedNumber: 'false',
      quantity: _quantityController.text.trim(),
    );
    ref.read(buyExamNotifer.notifier).buyExam(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            //  _isBuyAirtimeEnabled.value = false;
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
