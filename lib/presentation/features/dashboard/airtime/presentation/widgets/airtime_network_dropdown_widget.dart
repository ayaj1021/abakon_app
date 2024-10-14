import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/services/data/model/get_all_services_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AirtimeNetWorkDropDown extends StatefulWidget {
  AirtimeNetWorkDropDown(
      {super.key,
      required this.airtimePlans,
      required this.onNetworkSelected,
      required this.selectedNetwork,
      required this.onNidSelected,
      required this.selectedNid});
  final List<AirtimeDiscount> airtimePlans;
  String? selectedNetwork;
  int? selectedNid;
  final Function(String) onNetworkSelected;
  final Function(String) onNidSelected;

  @override
  State<AirtimeNetWorkDropDown> createState() => _AirtimeNetWorkDropDownState();
}

class _AirtimeNetWorkDropDownState extends State<AirtimeNetWorkDropDown> {
  @override
  Widget build(BuildContext context) {
    final plans = widget.airtimePlans.map((plan) => plan.network).toSet();
    return DropdownButtonFormField(
      value: widget.selectedNetwork,
      elevation: 0,
      decoration: InputDecoration(
        labelText: 'Select network provider',
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
      items: plans.map((airtime) {
        return DropdownMenuItem<String>(
          value: airtime,
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
              Text(airtime.toString(),
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.selectedNetwork = newValue!;
          widget.selectedNid = widget.airtimePlans
              .firstWhere((discount) => discount.network == newValue)
              .nId;
        });
        widget.onNetworkSelected(newValue!);
        widget.onNidSelected( widget.selectedNid.toString());
      },
    );
  }
}

List cables = [
  {"logo": "assets/logo/mtn.png", "title": "Mtn"},
  {"logo": "assets/logo/airtel.png", "title": "Airtel"},
  {"logo": "assets/logo/glo.png", "title": "Glo"},
  {"logo": "assets/logo/9mobile.png", "title": "9mobile"},
];
