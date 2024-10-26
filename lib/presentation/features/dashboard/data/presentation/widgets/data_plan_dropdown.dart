import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/get_all_data_service_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataPlanDropDown extends StatefulWidget {
  DataPlanDropDown(
      {super.key,
      required this.dataPlans,
      required this.onPlanSelected,
      required this.onDataIdSelected,
      required this.selectedPlan,
      required this.selectedDataId,
      this.selectedNetwork,
      this.selectedType});
  final List<Plan> dataPlans;

  String? selectedPlan;
  final String? selectedNetwork;
  final String? selectedType;
  String? selectedDataId;

  final Function(String) onPlanSelected;
  final Function(String) onDataIdSelected;

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
      items: plans.map((plan) {
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
          widget.selectedDataId = widget.dataPlans
              .firstWhere((discount) => discount.name == newValue)
              .planid;
        });
        widget.onPlanSelected(newValue!);
        widget.onDataIdSelected(widget.selectedDataId.toString());
      },
    );
  }
}

List plans = [
  {"title": "Vtu"},
  {"title": "Share and sell"},
];
