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
      required this.selectedPlan});
  final List<DataPlan> dataPlans;

  String? selectedPlan;
  String? selectedPlanId;
  final Function(String, String) onPlanSelected;

  @override
  State<DataPlanDropDown> createState() => _DataPlanDropDownState();
}

class _DataPlanDropDownState extends State<DataPlanDropDown> {
  @override
  Widget build(BuildContext context) {
    final plans = widget.dataPlans.map((plan) => plan.name).toSet();
     widget.selectedPlanId = widget.dataPlans.where((e)=> e.pId == plans).toString();
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
          widget.selectedPlan = newValue!;
        });
        widget.onPlanSelected(newValue!,   widget.selectedPlanId.toString());
      },
    );
  }
}

List plans = [
  {"title": "Vtu"},
  {"title": "Share and sell"},
];
