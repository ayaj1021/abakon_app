import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/get_all_data_service_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataNetWorkDropDown extends StatefulWidget {
  DataNetWorkDropDown(
      {super.key,
      required this.dataPlans,
      required this.selectedNetwork,
      required this.onNetworkSelected,
      required this.onNidSelected,
      required this.selectedNid});

  final List<Plan> dataPlans;
  String? selectedNetwork;
  int? selectedNid;
  final Function(String) onNetworkSelected;
  final Function(String) onNidSelected;

  @override
  State<DataNetWorkDropDown> createState() => _DataNetWorkDropDownState();
}

class _DataNetWorkDropDownState extends State<DataNetWorkDropDown> {
  @override
  Widget build(BuildContext context) {
    final plans = widget.dataPlans.map((plan) => plan.network).toSet();
    return DropdownButtonFormField(
      value: widget.selectedNetwork,
      onChanged: (String? newValue) {
        setState(() {
          widget.selectedNetwork = newValue!;

          widget.selectedNid = widget.dataPlans
              .firstWhere((discount) => discount.network == newValue)
              .nId;
        });
        widget.onNetworkSelected(newValue!);
        widget.onNidSelected(widget.selectedNid.toString());
      },
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
      items: plans
          .map<DropdownMenuItem<String>>((dataPlans) {
            return DropdownMenuItem<String>(
              value: dataPlans.toString(),
              child: Row(
                children: [
                  // SizedBox(
                  //   height: 32.h,
                  //   width: 32.w,
                  //   child:

                  //   Image.asset(
                  //     //logo
                  //    // logo
                  //     networkProvidersImage[2],
                  //     // fit: BoxFit.cover,
                  //   ),
                  // ),
                  Text(dataPlans.toString(),
                      style: const TextStyle(color: Colors.black)),
                ],
              ),
            );
          })
          .toSet()
          .toList(),
    );
  }
}

List cables = [
  {"logo": "assets/logo/mtn.png", "title": "Mtn"},
  {"logo": "assets/logo/airtel.png", "title": "Airtel"},
  {"logo": "assets/logo/glo.png", "title": "Glo"},
  {"logo": "assets/logo/9mobile.png", "title": "9mobile"},
];

List<String> networkProvidersImage = [
  'assets/logo/mtn.png',
  'assets/logo/glo.png',
  'assets/logo/airtel.png',
  'assets/logo/9mobile.png',
];
