import 'package:abakon/presentation/features/other_services/presentation/widgets/other_services_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class OtherServicesSection extends StatelessWidget {
  const OtherServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OtherServicesWidgets(
              icon: 'assets/icons/airtime_outline_icon.svg',
              title: 'Airtime',
              //   onTap: () => context.push(Airtime.routeName),
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/data_outline_icon.svg',
              title: 'Data',
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/electricity_outline_icon.svg',
              title: 'Electricity',
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/cable_outline_icon.svg',
              title: 'Cable TV',
            ),
          ],
        ),
        VerticalSpacing(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OtherServicesWidgets(
              icon: 'assets/icons/internet_outline_icon.svg',
              title: 'Internet',
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/betting_outline_icon.svg',
              title: 'Betting',
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/giftcard_outline_icon.svg',
              title: 'Gift Card',
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/virtualcard_outline_icon.svg',
              title: 'Virtual Card',
            ),
          ],
        ),
        VerticalSpacing(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OtherServicesWidgets(
              icon: 'assets/icons/giftuser_outline_icon.svg',
              title: 'Gift User',
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/ticket_outline_icon.svg',
              title: 'Ticket',
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/bookflight_outline_icon.svg',
              title: 'Book Flight',
            ),
            OtherServicesWidgets(
              icon: 'assets/icons/esims_outline_icon.svg',
              title: 'E-sims',
            ),
          ],
        ),
      ],
    );
  }
}
