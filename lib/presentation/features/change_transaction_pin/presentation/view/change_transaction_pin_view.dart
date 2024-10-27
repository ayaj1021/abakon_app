import 'package:abakon/presentation/features/change_transaction_pin/presentation/widgets/change_transaction_pin_header.dart';
import 'package:abakon/presentation/features/change_transaction_pin/presentation/widgets/change_transaction_pin_section.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ChangeTransactionPinView extends StatefulWidget {
  const ChangeTransactionPinView({super.key});
  static const routeName = '/changeTransactionPin';

  @override
  State<ChangeTransactionPinView> createState() =>
      _ChangeTransactionPinViewState();
}

class _ChangeTransactionPinViewState extends State<ChangeTransactionPinView> {
  final ValueNotifier<bool> _isChangePinEnabled = ValueNotifier(false);
  late TextEditingController _oldPinController;
  late TextEditingController _newPinController;
  late TextEditingController _confirmNewPinController;

  @override
  void initState() {
    _oldPinController = TextEditingController()..addListener(_listener);
    _newPinController = TextEditingController()..addListener(_listener);
    _confirmNewPinController = TextEditingController()..addListener(_listener);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await ref
      //     .read(getUserDetailsNotifierProvider.notifier)
      //     .getAllUserDetails();
    });
    super.initState();
  }

  void _listener() {
    _isChangePinEnabled.value = _oldPinController.text.isNotEmpty &&
        _newPinController.text.isNotEmpty &&
        _confirmNewPinController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _isChangePinEnabled.dispose();
    _oldPinController.dispose();
    _newPinController.dispose();
    _confirmNewPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 20,
          ),
          child: Column(
            children: [
              const ChangeTransactionPinHeader(),
              const VerticalSpacing(32),
              ChangeTransactionPinSection(
                oldPinController: _oldPinController,
                newPinController: _newPinController,
                confirmNewPinController: _confirmNewPinController,
              ),
              const VerticalSpacing(300),
              AbakonSendButton(
                onTap: () {},
                title: 'Update Transaction Pin',
              )
            ],
          ),
        ),
      ),
    );
  }
}
