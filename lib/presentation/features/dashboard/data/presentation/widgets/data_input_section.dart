import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_network_dropdown_widget.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_plan_dropdown.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_text_field.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/widgets/data_type_dropdown_widget.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:abakon/presentation/general_widgets/success_widget.dart';
import 'package:flutter/material.dart';

class DataInputSection extends StatelessWidget {
  const DataInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DataNetWorkDropDown(),
        const VerticalSpacing(16),
        const DataTypeDropDown(),
        const VerticalSpacing(16),
        const DataPlanDropDown(),
        const VerticalSpacing(16),
        const DataTextField(labelText: 'Phone Number'),
        const VerticalSpacing(300),
        AbakonSendButton(
            onTap: () {
              successAlertDialog(
                context,
                child: const SuccessWidget(),
              );
            },
            title: 'Buy Data Bundle')
      ],
    );
  }

  Future<dynamic> successAlertDialog(BuildContext context,
      {required Widget child}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: child,
      ),
    );
  }
}
