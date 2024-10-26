import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/electricity/data/model/get_all_electricity_service_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElectricityProviderDropDown extends StatefulWidget {
  ElectricityProviderDropDown(
      {super.key,
      required this.electricityPlans,
      required this.onElectricityProviderSelected,
      required this.selectedElectricityProvider});
  final List<ElectricityProvider> electricityPlans;
  String? selectedElectricityProvider;
  final Function(String) onElectricityProviderSelected;
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
              // SizedBox(
              //   height: 32.h,
              //   width: 32.w,
              //   child: Image.asset(
              //     cables['logo'],
              //     // fit: BoxFit.cover,
              //   ),
              // ),
              Text(electricity.toString(),
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.selectedElectricityProvider = newValue!;
        });
        widget.onElectricityProviderSelected(newValue!);
      },
    );
    // Positioned(
    //   top: -15,
    //   left: 10,
    //   child: Container(
    //     padding: EdgeInsets.all(5),
    //     // color: Colors.red,
    //     child: Text('select provider'),
    //   ),
    // ),

    // DropdownMenu(
    //     width: MediaQuery.of(context).size.width - 20,
    //     enableSearch: false,
    //     menuStyle: const MenuStyle(
    //       elevation: WidgetStatePropertyAll(0),
    //     ),
    //     inputDecorationTheme: const InputDecorationTheme(
    //         outlineBorder: BorderSide(
    //           color: AppColors.primaryBFBCBB,
    //           width: 3,
    //         ),
    //         activeIndicatorBorder: BorderSide(
    //           width: 4,
    //           color: AppColors.primaryBFBCBB,
    //         )),
    //     label: Text(
    //       labelText,
    //       style: context.textTheme.s14w500.copyWith(
    //         color: AppColors.primary595857,
    //       ),
    //     ),
    //     dropdownMenuEntries: cables.map(
    //       (cables) {
    //         return DropdownMenuEntry(
    //           value: Row(
    //             children: [
    //               SvgPicture.asset(
    //                 cables['logo'],
    //               ),
    //               Text(cables['title'])
    //             ],
    //           ),
    //           label: cables['title'],
    //           leadingIcon: SvgPicture.asset(
    //             cables['logo'],
    //           ),
    //         );
    //       },
    //     ).toList());
  }
}

//width: double.infinity,
// padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
// decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(5),
//     border: Border.all(color: AppColors.primaryBFBCBB)),

List cables = [
  {"logo": "assets/logo/gotv.png", "title": "Gotv"},
  {"logo": "assets/logo/dstv.png", "title": "Dstv"},
  {"logo": "assets/logo/startimes.png", "title": "Startimes"},
];

// class DropDownWidget extends StatefulWidget {
//   const DropDownWidget({super.key});

//   @override
//   State<DropDownWidget> createState() => _DropDownWidgetState();
// }

// class _DropDownWidgetState extends State<DropDownWidget> {
//   String? selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: DropdownButtonFormField<String>(
//         value: selectedValue,
//         decoration: InputDecoration(
//           labelText: 'Select Item',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(
//               color: Colors.blue,
//               width: 2.0,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(
//               color: Colors.blueAccent,
//               width: 2.0,
//             ),
//           ),
//         ),
//         items: ['Item 1', 'Item 2', 'Item 3'].map((String item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(item),
//           );
//         }).toList(),
//         onChanged: (String? newValue) {
//           setState(() {
//             selectedValue = newValue;
//           });
//         },
//       ),
//     );
//   }
// }



