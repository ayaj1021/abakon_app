import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ExamPinProviderDropDown extends StatelessWidget {
  const ExamPinProviderDropDown({super.key});

  @override
  Widget build(BuildContext context) {
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

      // dropdownColor: Colors.transparent,
      items: cables.map((cables) {
        return DropdownMenuItem<String>(
          value: cables['title'],
          child: Text(cables['title'],
              style: const TextStyle(color: Colors.black)),
        );
      }).toList(),
      onChanged: (newValue) {},
    );
  }
}

List cables = [
  {"title": "WAEC"},
  {"title": "NECO"},
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



