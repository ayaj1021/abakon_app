import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/exam_pin/data/model/get_all_exam_data_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExamPinProviderDropDown extends StatefulWidget {
  ExamPinProviderDropDown({
    super.key,
    required this.examPlans,
    required this.onNetworkSelected,
    required this.onEidSelected,
    required this.selectedProvider,
    required this.selectedEid,
    required this.selectedEPrice,
    required this.onEPriceSelected,
  });
  final List<ExamData> examPlans;
  String? selectedProvider;
  int? selectedEid;
  num? selectedEPrice;
  final Function(String) onNetworkSelected;
  final Function(String) onEidSelected;
  final Function(num) onEPriceSelected;

  @override
  State<ExamPinProviderDropDown> createState() =>
      _ExamPinProviderDropDownState();
}

class _ExamPinProviderDropDownState extends State<ExamPinProviderDropDown> {
  @override
  Widget build(BuildContext context) {
    final provider = widget.examPlans.map((plan) => plan.provider).toSet();
    return DropdownButtonFormField(
      value: widget.selectedProvider,
      onChanged: (String? newValue) {
        setState(() {
          widget.selectedProvider = newValue!;
          widget.selectedEid = widget.examPlans
              .firstWhere((examProv) => examProv.provider == newValue)
              .eId;
          widget.selectedEPrice = widget.examPlans
              .firstWhere((examProv) => examProv.provider == newValue)
              .price;
        });
        widget.onNetworkSelected(newValue!);
        widget.onEidSelected(widget.selectedEid.toString());
        widget.onEPriceSelected(widget.selectedEPrice!);
      },
      elevation: 0,
      decoration: InputDecoration(
        labelText: 'Select provider',
        labelStyle: context.textTheme.s12w500.copyWith(
          color: AppColors.primary595857,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Colors.white,
              strokeAlign: BorderSide.strokeAlignCenter,
              style: BorderStyle.none),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
            style: BorderStyle.none,
          ),
        ),
      ),

      // dropdownColor: Colors.transparent,
      items: provider.map((providers) {
        return DropdownMenuItem<String>(
          value: providers,
          child: Text(providers.toString(),
              style: const TextStyle(color: Colors.black)),
        );
      }).toList(),
    );
  }
}
