import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/cable/data/model/get_all_cable_data_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CableProviderDropDown extends StatefulWidget {
  CableProviderDropDown(
      {super.key,
      required this.labelText,
      required this.cablePlans,
      required this.selectedCableProvider,
      required this.onCableProviderSelected});
  final String labelText;
  final List<CableData> cablePlans;
  String? selectedCableProvider;
  final Function(String) onCableProviderSelected;
  @override
  State<CableProviderDropDown> createState() => _CableProviderDropDownState();
}

class _CableProviderDropDownState extends State<CableProviderDropDown> {
  @override
  Widget build(BuildContext context) {
    final cableProvider =
        widget.cablePlans.map((plan) => plan.cableprovider).toSet();
    // final cableNames = widget.cablePlans.where(
    //     (plan) => plan.cableprovider == cables.map((cable) => cable).toList());
    return DropdownButtonFormField(
      elevation: 0,
      value: widget.selectedCableProvider,
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
      items: cableProvider.map((cablesPlans) {
        return DropdownMenuItem<String>(
          value: cablesPlans.toString(),
          child: Row(
            children: [
              // SizedBox(
              //   height: 32.h,
              //   width: 32.w,
              //   child: Image.asset(
              //     cables['logo'],
              //     // fit: BoxFit.cover,
              //   ),
              // ),
              Text(cablesPlans.toString(),
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.selectedCableProvider = newValue!;
        });
        widget.onCableProviderSelected(newValue!);
      },
    );
  }
}

List cables = [
  "Gotv",
  "Dstv",
  "Startimes",
];
