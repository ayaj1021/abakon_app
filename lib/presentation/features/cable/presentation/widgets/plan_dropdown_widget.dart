import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/cable/data/model/get_all_cable_data_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CablePlansDown extends StatefulWidget {
  CablePlansDown(
      {super.key,
      required this.labelText,
      required this.filteredPlans,
      required this.onCablePlanSelected,
      required this.selectedCablePlan,
      required this.selectedCableProvider});
  final String labelText;
  final List<CableData> filteredPlans;
  String? selectedCablePlan;
  String? selectedCableProvider;
  final Function(String) onCablePlanSelected;

  @override
  State<CablePlansDown> createState() => _CablePlansDownState();
}

class _CablePlansDownState extends State<CablePlansDown> {
  @override
  Widget build(BuildContext context) {
    final cablePlans = widget.filteredPlans.map((plan) => plan.name);
    return DropdownButtonFormField(
      elevation: 0,
      value: widget.selectedCablePlan,
      decoration: InputDecoration(
        labelText: 'Plan',
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
      items: cablePlans.map((plans) {
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
          widget.selectedCablePlan = newValue!;
        });
        widget.onCablePlanSelected(newValue!);
      },
    );
  }
}

// List plans = [
//   {"title": "Dstv premium Asia"},
//   {"title": "Dstv Padi"},
//   {"title": "Dstv compact plus"},
// ];
