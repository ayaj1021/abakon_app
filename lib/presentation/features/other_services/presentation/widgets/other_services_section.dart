import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/presentation/features/other_services/presentation/widgets/other_services_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class OtherServicesSection extends StatelessWidget {
  const OtherServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     OtherServicesWidgets(
        //       icon: 'assets/icons/airtime_outline_icon.svg',
        //       title: 'Airtime',
        //       //   onTap: () => context.push(Airtime.routeName),
        //     ),
        //     OtherServicesWidgets(
        //       icon: 'assets/icons/data_outline_icon.svg',
        //       title: 'Data',
        //     ),
        //     OtherServicesWidgets(
        //       icon: 'assets/icons/electricity_outline_icon.svg',
        //       title: 'Electricity',
        //     ),
        //     OtherServicesWidgets(
        //       icon: 'assets/icons/cable_outline_icon.svg',
        //       title: 'Cable TV',
        //     ),
        //   ],
        // ),
        //VerticalSpacing(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OtherServicesWidgets(
              icon: 'assets/icons/internet_outline_icon.svg',
              title: 'Internet',
              onTap: () => context.showSuccess(
                  title: 'Unavailable', message: 'Coming soon'),
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/betting_outline_icon.svg',
              title: 'Betting',
              onTap: () => context.showSuccess(
                  title: 'Unavailable', message: 'Coming soon'),
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/giftcard_outline_icon.svg',
              title: 'Gift Card',
              onTap: () => context.showSuccess(
                  title: 'Unavailable', message: 'Coming soon'),
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/virtualcard_outline_icon.svg',
              title: 'Virtual Card',
              onTap: () => context.showSuccess(
                  title: 'Unavailable', message: 'Coming soon'),
            ),
          ],
        ),
        const VerticalSpacing(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OtherServicesWidgets(
              icon: 'assets/icons/giftuser_outline_icon.svg',
              title: 'Gift User',
              onTap: () => context.showSuccess(
                  title: 'Unavailable', message: 'Coming soon'),
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/ticket_outline_icon.svg',
              title: 'Ticket',
              onTap: () => context.showSuccess(
                  title: 'Unavailable', message: 'Coming soon'),
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/bookflight_outline_icon.svg',
              title: 'Book Flight',
              onTap: () => context.showSuccess(
                  title: 'Unavailable', message: 'Coming soon'),
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/esims_outline_icon.svg',
              title: 'E-sims',
              onTap: () => context.showSuccess(
                  title: 'Unavailable', message: 'Coming soon'),
            ),
          ],
        ),
      ],
    );
  }
}
