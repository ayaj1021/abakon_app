
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
      required this.selectedCableId,
      required this.onCableProviderSelected,
      required this.onCableIdSelected});
  final String labelText;
  final List<CableData> cablePlans;
  String? selectedCableProvider;
  int? selectedCableId;
  final Function(String) onCableProviderSelected;
  final Function(String) onCableIdSelected;
  @override
  State<CableProviderDropDown> createState() => _CableProviderDropDownState();
}

class _CableProviderDropDownState extends State<CableProviderDropDown> {
  @override
  Widget build(BuildContext context) {
    final cableProvider =
        widget.cablePlans.map((plan) => plan.provider).toSet();

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
      items: cableProvider.map((cablesPlans) {
        return DropdownMenuItem<String>(
          value: cablesPlans,
          child: Row(
            children: [
              Text(cablesPlans.toString(),
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.selectedCableProvider = newValue!;

          widget.selectedCableId = widget.cablePlans
              .firstWhere((discount) => discount.provider == newValue)
              .cId;
        });
        widget.onCableIdSelected(widget.selectedCableId.toString());
        widget.onCableProviderSelected(newValue!);
      },
    );
  }
}
