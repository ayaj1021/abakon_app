import 'package:flutter/material.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('An Error occured')
      ],
    );
  }
}