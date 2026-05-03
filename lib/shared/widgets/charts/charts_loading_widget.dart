import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/widgets_extensions.dart';
import '../../../core/utils/app_text_style.dart';

class ChartsLoadingWidget extends StatelessWidget {
  const ChartsLoadingWidget({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isDesktop
          ? context.width * .39
          : context.isTablet
          ? context.width * .6
          : context.width * .9,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Card(
          key: const ValueKey('loading'),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // * Neon loader
                LoadingAnimationWidget.threeArchedCircle(color: color, size: 100),

                16.height,

                Text(
                  'جاري التحميل',
                  style: AppTextStyles.body19Regular.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
