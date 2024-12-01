import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/abakon_app_loader.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PageLoader extends StatelessWidget {
  const PageLoader({super.key, required this.child, required this.isLoading});
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        color: AppColors.primaryColor.withOpacity(0.05),
        progressIndicator: const _AppLoader(),
        isLoading: isLoading,
        child: PopScope(canPop: !isLoading, child: child));
  }
}


class _AppLoader extends StatelessWidget {
  const _AppLoader();

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  LoadingAnimationWidget.flickr(
        leftDotColor: AppColors.primaryColor,
        rightDotColor: Colors.blue,
         size: 50,
      ),
    );
  }
}