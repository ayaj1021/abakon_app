import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/services/data/model/get_all_services_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataTypeDropDown extends StatefulWidget {
  DataTypeDropDown(
      {super.key,
      required this.dataPlans,
      required this.ontypeSelected,
      required this.selectedType});
  final List<DataPlan> dataPlans;
  String? selectedType;
  final Function(String) ontypeSelected;
  @override
  State<DataTypeDropDown> createState() => _DataTypeDropDownState();
}

class _DataTypeDropDownState extends State<DataTypeDropDown> {
  @override
  Widget build(BuildContext context) {
    final plans = widget.dataPlans.map((plan) => plan.type).toSet();
    return DropdownButtonFormField(
      value: widget.selectedType,
      elevation: 0,
      decoration: InputDecoration(
        labelText: 'Data Type',
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
      items: plans.map((plans) {
        return DropdownMenuItem<String>(
          value: plans,
          child: Text(
            plans.toString(),
            style: context.textTheme.s12w500.copyWith(
              color: AppColors.black,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.selectedType = newValue!;
        });
        widget.ontypeSelected(newValue!);
      },
    );
  }
}

List planss = [
  {"title": "Vtu"},
  {"title": "Share and sell"},
];
