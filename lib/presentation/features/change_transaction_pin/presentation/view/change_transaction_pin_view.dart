import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/change_transaction_pin/data/model/change_transaction_pin_request.dart';
import 'package:abakon/presentation/features/change_transaction_pin/presentation/notifier/change_transaction_pin_notifier.dart';
import 'package:abakon/presentation/features/change_transaction_pin/presentation/widgets/change_transaction_pin_header.dart';
import 'package:abakon/presentation/features/change_transaction_pin/presentation/widgets/change_transaction_pin_section.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeTransactionPinView extends ConsumerStatefulWidget {
  const ChangeTransactionPinView({super.key});
  static const routeName = '/changeTransactionPin';

  @override
  ConsumerState<ChangeTransactionPinView> createState() =>
      _ChangeTransactionPinViewState();
}

class _ChangeTransactionPinViewState
    extends ConsumerState<ChangeTransactionPinView> {
  final ValueNotifier<bool> _isChangePinEnabled = ValueNotifier(false);
  late TextEditingController _oldPinController;
  late TextEditingController _newPinController;
  late TextEditingController _confirmNewPinController;

  @override
  void initState() {
    _oldPinController = TextEditingController()..addListener(_listener);
    _newPinController = TextEditingController()..addListener(_listener);
    _confirmNewPinController = TextEditingController()..addListener(_listener);

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
        child: SingleChildScrollView(
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
                ValueListenableBuilder(
                    valueListenable: _isChangePinEnabled,
                    builder: (context, r, c) {
                      return Consumer(builder: (context, re, c) {
                        final isLoading = re.watch(
                          changeTransactionPinNotifer.select(
                              (v) => v.changeTransactionPinState.isLoading),
                        );
                        return AbakonSendButton(
                          isLoading: isLoading,
                          isEnabled: r,
                          onTap: () {
                            _changeTransactionPin();
                          },
                          title: 'Update Transaction Pin',
                        );
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _changeTransactionPin() {
    final data = ChangeTransactionPinRequest(
      oldPin: _oldPinController.text.trim(),
      newPin: _newPinController.text.trim(),
      confirmNewPin: _confirmNewPinController.text.trim(),
    );
    ref.read(changeTransactionPinNotifer.notifier).changeTransactionPin(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            _isChangePinEnabled.value = false;
            context.showSuccess(message: message);
          },
        );
  }
}
