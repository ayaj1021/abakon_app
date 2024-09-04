import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(services.length, (index) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryColor,
                        )),
                    child: SvgPicture.asset(services[index]['logo']),
                  ),
                  const VerticalSpacing(4),
                  Text(
                    services[index]['title'],
                    style: context.textTheme.s10w500
                        .copyWith(color: AppColors.primary010101),
                  ),
                ],
              );
            }),
          )),
    );
  }
}

List<Map<String, dynamic>> services = [
  {'logo': 'assets/icons/cable.svg', 'title': 'Cable tv'},
  {'logo': 'assets/icons/electricity.svg', 'title': 'Electricity'},
  {'logo': 'assets/icons/exam_pin.svg', 'title': 'Exam pin'},
  {'logo': 'assets/icons/more.svg', 'title': 'Other \nServices'},
  // {'logo': 'assets/svg/airtime_new.svg', 'title': 'Airtime to Cash'},
  // {'logo': 'assets/svg/internet_new.svg', 'title': 'Bulk Sms'},
];
