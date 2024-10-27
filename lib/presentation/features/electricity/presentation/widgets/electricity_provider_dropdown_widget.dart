import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/electricity/data/model/get_all_electricity_service_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElectricityProviderDropDown extends StatefulWidget {
  ElectricityProviderDropDown({
    super.key,
    required this.electricityPlans,
    required this.onElectricityProviderSelected,
    required this.onElectricityProviderIdSelected,
    required this.selectedElectricityProvider,
    required this.selectedElectricityProviderId,
  });
  final List<ElectricityProvider> electricityPlans;
  String? selectedElectricityProvider;
  int? selectedElectricityProviderId;
  final Function(String) onElectricityProviderSelected;
  final Function(String) onElectricityProviderIdSelected;
  @override
  State<ElectricityProviderDropDown> createState() =>
      _ElectricityProviderDropDownState();
}

class _ElectricityProviderDropDownState
    extends State<ElectricityProviderDropDown> {
  @override
  Widget build(BuildContext context) {
    final electricityProvider =
        widget.electricityPlans.map((plan) => plan.provider).toSet();
    return DropdownButtonFormField(
      elevation: 0,
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
      items: electricityProvider.map((electricity) {
        return DropdownMenuItem<String>(
          value: electricity,
          child: Row(
            children: [
              Text(electricity.toString(),
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.selectedElectricityProvider = newValue!;
          widget.selectedElectricityProviderId = widget.electricityPlans
              .firstWhere((discount) => discount.provider == newValue)
              .eId;
        });
        widget.onElectricityProviderSelected(newValue!);
        widget.onElectricityProviderIdSelected(
            widget.selectedElectricityProviderId.toString());
      },
    );
  }
}

List cables = [
  {"logo": "assets/logo/gotv.png", "title": "Gotv"},
  {"logo": "assets/logo/dstv.png", "title": "Dstv"},
  {"logo": "assets/logo/startimes.png", "title": "Startimes"},
];
