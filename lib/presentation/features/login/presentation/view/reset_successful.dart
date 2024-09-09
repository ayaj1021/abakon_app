
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/ds_bottom_sheet.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';


class ResetSuccessful extends StatefulWidget {
  const ResetSuccessful({super.key});

  @override
  State<ResetSuccessful> createState() => _ResetSuccessfulState();
}

class _ResetSuccessfulState extends State<ResetSuccessful> {
  @override
  Widget build(BuildContext context) {
    return AbakonBottomSheet(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/icons/check-mark.svg',
          ),
            const VerticalSpacing(27),
          Text(
            Strings.passwordReset,
            style: context.textTheme.s16w700,
            textAlign: TextAlign.center,
          ),
                const VerticalSpacing(55),
          const Text(
            Strings.passwordResetSub,
            textAlign: TextAlign.center,
          ),
                 const VerticalSpacing(37),
          AbakonSendButton(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                Login.routeName,
              );
            },
            title: Strings.login,
          ),
        ],
      ),
    );
  }
}
