import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/app_text_style.dart';

class PageHeaderWidget extends StatelessWidget {
  const PageHeaderWidget({super.key, required this.title, required this.subtitle, this.trailing});
  final String title, subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const .fromSTEB(35, 0, 35, 10),
      title: Text(title, style: AppTextStyles.heading33Bold),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.body16Regular.copyWith(color: AppColors.textSecondary),
      ),
      trailing: trailing,
    );
  }
}
