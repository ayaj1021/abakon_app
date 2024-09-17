import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/app_loader.dart';
import 'package:flutter/material.dart';

class AbakonSendButton extends StatefulWidget {
  const AbakonSendButton({
    required this.onTap,
    required this.title,
    super.key,
    this.isEnabled = true,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.hasBorder = false,
    this.isLoading = false,
    this.width = double.infinity,
    this.borderColor = AppColors.primary1D1446,
  });

  final bool isEnabled;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final bool hasBorder;
  final String title;
  final void Function() onTap;
  final bool isLoading;
  final double width;

  @override
  State<AbakonSendButton> createState() => _AbakonSendButtonState();
}

class _AbakonSendButtonState extends State<AbakonSendButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: InkWell(
        onTap: widget.isEnabled ? widget.onTap : null,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.isEnabled
                  ? widget.backgroundColor
                  : AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.fromBorderSide(
                widget.hasBorder
                    ? BorderSide(color: widget.borderColor)
                    : BorderSide.none,
              )),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: widget.isLoading
                ? const Center(child: AppLoader())
                : Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
