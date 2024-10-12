import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionSearchSection extends StatelessWidget {
  const TransactionSearchSection({
    super.key,
    required this.labelText,
    required this.controller,
  });
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
     
      //padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryBFBCBB,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 240.w,

            //width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  hintText: 'Search transactions',
                  labelStyle: context.textTheme.s10w500.copyWith(
                    color: AppColors.primary595857,
                  ),
                  helperStyle: context.textTheme.s10w500.copyWith(
                    color: AppColors.primary595857,
                  ),
                  //labelText: labelText,
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal:  12, vertical: 16.5),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Text(
              Strings.search,
              style: context.textTheme.s12w600.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}