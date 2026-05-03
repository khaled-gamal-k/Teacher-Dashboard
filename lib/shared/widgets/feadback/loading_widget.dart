import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/extensions/widgets_extensions.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.size = 60, this.showText = true});

  final double size;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: AppColors.primaryBackground.withValues(alpha: 0.4),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // * Neon loader
              LoadingAnimationWidget.staggeredDotsWave(color: AppColors.primaryAccent, size: size),

              if (showText) 16.height,

              if (showText)
                Text(
                  'جاري التحميل',
                  style: AppTextStyles.body19Regular.copyWith(color: AppColors.textSecondary),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
