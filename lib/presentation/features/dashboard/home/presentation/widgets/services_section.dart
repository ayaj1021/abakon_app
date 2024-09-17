import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/cable/presentation/view/cable_screen.dart';
import 'package:abakon/presentation/features/other_services/presentation/view/other_services_screen.dart';
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
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ServicesWidget(
              image: 'assets/icons/cable.svg',
              serviceTitle: 'Cable tv',
              onTap: () => context.pushNamed(CableScreen.routeName),
            ),
            const ServicesWidget(
              image: 'assets/icons/electricity.svg',
              serviceTitle: 'Electricity',
            ),
            const ServicesWidget(
              image: 'assets/icons/exam_pin.svg',
              serviceTitle: 'Exam pin',
            ),
             ServicesWidget(
              onTap: () => context.pushNamed(OtherServicesScreen.routeName),
              image: 'assets/icons/more.svg',
              serviceTitle: 'Other \nServices',
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({
    super.key,
    required this.image,
    required this.serviceTitle,
    this.onTap,
  });
  final String image;
  final String serviceTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                )),
            child: SvgPicture.asset(image),
          ),
          const VerticalSpacing(4),
          Text(
            serviceTitle,
            style: context.textTheme.s10w500
                .copyWith(color: AppColors.primary010101),
          ),
        ],
      ),
    );
  }
}
