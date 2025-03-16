import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/get_all_data_service_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataPlanDropDown extends StatefulWidget {
  DataPlanDropDown(
      {super.key,
      required this.filteredPlans,
      required this.onPlanSelected,
      required this.onDataIdSelected,
      required this.selectedPlan,
      required this.selectedPlanPrice,
      required this.selectedDataId,
      this.selectedNetwork,
      this.selectedType,
      required this.onPlanPriceSelected});
  final List<Plan> filteredPlans;

  String? selectedPlan;
  String? selectedPlanPrice;
  final String? selectedNetwork;
  final String? selectedType;
  String? selectedDataId;

  final Function(String) onPlanSelected;
  final Function(String) onPlanPriceSelected;
  final Function(String) onDataIdSelected;

  @override
  State<DataPlanDropDown> createState() => _DataPlanDropDownState();
}

class _DataPlanDropDownState extends State<DataPlanDropDown> {
  @override
  Widget build(BuildContext context) {
    final plans = widget.filteredPlans.map((plan) => plan.name).toSet();
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
        // setState(() {
        //   widget.selectedPlan = newValue!;
        //   widget.selectedDataId = widget.filteredPlans
        //       .firstWhere((discount) => discount.name == newValue)
        //       .pId
        //       .toString();
        //   widget.selectedPlanPrice = widget.filteredPlans
        //       .firstWhere((discount) => discount.name == widget.selectedDataId)
        //       .userprice
        //       .toString();
        // });
        // widget.onPlanSelected(newValue!);
        // widget.onDataIdSelected(widget.selectedDataId.toString());
        // widget.onPlanPriceSelected(widget.selectedPlanPrice.toString());

        if (newValue != null) {
          final selectedPlan = widget.filteredPlans.firstWhere(
            (plan) => plan.name == newValue,
            orElse: () => throw Exception('Plan not found'),
          );

          setState(() {
            widget.selectedPlan = newValue;
            widget.selectedDataId = selectedPlan.pId.toString();
            widget.selectedPlanPrice = selectedPlan.userprice.toString();
          });

          widget.onPlanSelected(newValue);
          widget.onDataIdSelected(widget.selectedDataId!);
          widget.onPlanPriceSelected(widget.selectedPlanPrice!);
        }
      },
    );
  }
}
