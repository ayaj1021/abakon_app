import 'package:abakon/presentation/features/my_information/presentation/widgets/my_information_widget.dart';
import 'package:flutter/material.dart';

class MyInformationSection extends StatelessWidget {
  const MyInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MyInformationWidget(
          icon: 'assets/icons/person.svg',
          informationHeader: 'Full name: ',
          information: 'Joseph Kinglin',
        ),
        MyInformationWidget(
          icon: 'assets/icons/email.svg',
          informationHeader: 'Email: ',
          information: 'JosephKinglin@gmail.com',
        ),
        MyInformationWidget(
          icon: 'assets/icons/phone.svg',
          informationHeader: 'Phone: ',
          information: '0912345678',
        ),
        MyInformationWidget(
          icon: 'assets/icons/state_light_icon.svg',
          informationHeader: 'State: ',
          information: 'Lagos',
        ),
      ],
    );
  }
}
