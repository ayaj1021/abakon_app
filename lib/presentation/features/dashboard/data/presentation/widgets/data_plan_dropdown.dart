import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/services/data/model/get_all_services_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataPlanDropDown extends StatefulWidget {
  DataPlanDropDown(
      {super.key,
      required this.dataPlans,
      required this.onPlanSelected,
      required this.selectedPlan,
      this.selectedNetwork,
      this.selectedType});
  final List<DataPlan> dataPlans;

  String? selectedPlan;
  final String? selectedNetwork;
  final String? selectedType;

  final Function(String) onPlanSelected;

  @override
  State<DataPlanDropDown> createState() => _DataPlanDropDownState();
}

class _DataPlanDropDownState extends State<DataPlanDropDown> {
  @override
  Widget build(BuildContext context) {
    final filteredPlans = widget.dataPlans
        .where((plan) =>
            plan.network == widget.selectedNetwork &&
            plan.type == widget.selectedType)
        .toList();
       final plans = filteredPlans.map((plan) => plan.name).toSet();
    return DropdownButtonFormField(
      value: widget.selectedPlan,
      elevation: 0,
      decoration: InputDecoration(
        labelText: 'Data Plan',
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
      items: plans.map(( plan) {
        return DropdownMenuItem<String>(
          value: plan,
          child: Text(
            plan.toString(),
            style: context.textTheme.s12w500.copyWith(
              color: AppColors.black,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.selectedPlan = newValue!;
        });
        widget.onPlanSelected(newValue!);
      },
    );
  }
}

List plans = [
  {"title": "Vtu"},
  {"title": "Share and sell"},
];
