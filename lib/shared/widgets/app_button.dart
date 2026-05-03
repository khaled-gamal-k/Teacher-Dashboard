import 'package:flutter/material.dart';
import '../../core/extensions/widgets_extensions.dart';
import '../../core/utils/app_text_style.dart';

import '../../core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: const .symmetric(vertical: 13),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(25),
        gradient: const LinearGradient(
          colors: [AppColors.primaryAccent, AppColors.secondaryAccent],
        ),
      ),
      child: Text(title, style: AppTextStyles.body19Bold.copyWith(color: Colors.white)),
    ).onPressed(onPressed);
  }
}
