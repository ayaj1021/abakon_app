import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/get_all_airtime_service_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AirtimeTypeDropDown extends StatefulWidget {
  AirtimeTypeDropDown(
      {super.key,
      required this.airtimePlans,
      required this.onTypeSelected,
      required this.selectedType});

  final List<AirtimeData> airtimePlans;
  String? selectedType;
  final Function(String) onTypeSelected;

  @override
  State<AirtimeTypeDropDown> createState() => _AirtimeTypeDropDownState();
}

class _AirtimeTypeDropDownState extends State<AirtimeTypeDropDown> {
  @override
  Widget build(BuildContext context) {
    final plans = widget.airtimePlans.map((plan) => plan.aType).toSet();
    return DropdownButtonFormField(
      elevation: 0,
      decoration: InputDecoration(
        labelText: 'Type',
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
      onChanged: (newValue) {
           setState(() {
          widget.selectedType = newValue!;
        });
        widget.onTypeSelected(newValue!);
      },
    );
  }
}
