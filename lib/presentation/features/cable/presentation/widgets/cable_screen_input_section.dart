import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/confirm_cable_tv_subscription.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/network_dropdown_widget.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/plan_dropdown_widget.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/subscription_type_section.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class CableScreenInputSection extends StatelessWidget {
  const CableScreenInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NetWorkDropDown(
          labelText: 'Select provider',
        ),
        const VerticalSpacing(16),
        const CablePlansDown(
          labelText: 'Plan',
        ),
        const VerticalSpacing(16),
        TextField(
          decoration: InputDecoration(
            labelStyle: context.textTheme.s10w500.copyWith(
              color: AppColors.primary595857,
            ),
            labelText: 'Amount to pay',
            border: const OutlineInputBorder(),
          ),
        ),
        const VerticalSpacing(16),
        const SubcriptionTypeSection(),
        const VerticalSpacing(16),
        TextField(
          decoration: InputDecoration(
            labelStyle: context.textTheme.s10w500.copyWith(
              color: AppColors.primary595857,
            ),
            labelText: 'Customer phone number',
            border: const OutlineInputBorder(),
          ),
        ),
        const VerticalSpacing(16),
        TextField(
          decoration: InputDecoration(
            labelText: 'IUC number',
            labelStyle: context.textTheme.s10w500.copyWith(
              color: AppColors.primary595857,
            ),
            border: const OutlineInputBorder(),
          ),
        ),
        const VerticalSpacing(223),
        AbakonSendButton(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const ConfirmCableTvSubscription();
                  });
            },
            title: 'Continue')
      ],
    );
  }
}
