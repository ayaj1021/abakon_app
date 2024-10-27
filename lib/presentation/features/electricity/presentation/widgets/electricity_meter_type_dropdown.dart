import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElectricityMeterTypeDropDown extends StatefulWidget {
  ElectricityMeterTypeDropDown(
      {super.key,
      required this.selectedMeterType,
      required this.onMeterTypeSelected});

  String? selectedMeterType;
  final Function(String) onMeterTypeSelected;

  @override
  State<ElectricityMeterTypeDropDown> createState() =>
      _ElectricityMeterTypeDropDownState();
}

class _ElectricityMeterTypeDropDownState
    extends State<ElectricityMeterTypeDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      elevation: 0,
      decoration: InputDecoration(
        labelText: 'Meter Type',
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
      items: cables.map((cables) {
        return DropdownMenuItem<String>(
          value: cables['title'],
          child: Text(
            cables['title'],
            style: const TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.selectedMeterType = newValue!;
        });
        widget.onMeterTypeSelected(newValue!);
      },
    );
  }
}

List cables = [
  {"title": "Prepaid"},
  {"title": "Postpaid"},
];
