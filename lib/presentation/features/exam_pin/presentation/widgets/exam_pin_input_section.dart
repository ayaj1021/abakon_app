import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/notifier/get_all_exam_data_notifier.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_provider_dropdown_widget.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_text_field.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/purchase_bottom_sheet_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
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
  //late TextEditingController _quantityController;
  @override
  void initState() {
    _quantityController = TextEditingController()..addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getAllExamDataNotifierProvider.notifier).getAllExamData();
    });

    super.initState();
  }

  void _listener() {
    _isBuyExamEnabled.value = _selectedProvider != null &&
        // _selectedType != null &&
        // _selectedPlan != null &&
        _quantityController.text.isNotEmpty;
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
    return SizedBox(
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
                  totalPrice =
                      _selectedEPrice! * int.parse(_quantityController.text);
                });
              },
            ),
            const VerticalSpacing(16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                  color: AppColors.greyFill,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                "N ${totalPrice ?? _selectedEPrice ?? 0}",
              ),
            ),
            const VerticalSpacing(223),
            AbakonSendButton(
              onTap: () {
                showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return PurchaseBottomSheetWidget(
                        purchaseInfo:
                            'You are about to purchase an $_selectedProvider pin purchase of  of $totalPrice. Do you wish to continue?',
                        onTap: () {},
                      );
                    });
              },
              title: 'Continue',
            ),
          ],
        ),
    });
  }
}
