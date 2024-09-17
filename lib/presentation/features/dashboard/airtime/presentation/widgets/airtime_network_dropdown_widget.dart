import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AirtimeNetWorkDropDown extends StatelessWidget {
  const AirtimeNetWorkDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
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
      items: cables.map((cables) {
        return DropdownMenuItem<String>(
          value: cables['title'],
          child: Row(
            children: [
              SizedBox(
                height: 32.h,
                width: 32.w,
                child: Image.asset(
                  cables['logo'],
                  // fit: BoxFit.cover,
                ),
              ),
              Text(cables['title'],
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
        );
      }).toList(),
      onChanged: (newValue) {},
    );
  }
}



List cables = [
  {"logo": "assets/logo/mtn.png", "title": "Mtn"},
  {"logo": "assets/logo/airtel.png", "title": "Airtel"},
  {"logo": "assets/logo/glo.png", "title": "Glo"},
  {"logo": "assets/logo/9mobile.png", "title": "9mobile"},
];

