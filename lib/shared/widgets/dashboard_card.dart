import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teacher_dashboard/core/constants/app_colors.dart';
import 'package:teacher_dashboard/shared/widgets/app_icon.dart';
import 'package:teacher_dashboard/core/utils/app_text_style.dart';

import '../../core/extensions/context_extensions.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.number,
    required this.subtitle,
    required this.icon,
    this.color,
    this.bgColor,
  });

  final String number;
  final String subtitle;
  final FaIconData icon;
  final Color? color, bgColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: context.isDesktop
            ? context.width * .15
            : context.isTablet
            ? context.width * .25
            : context.width * .42,
      ),
      child: Card(
        child: ListTile(
          contentPadding: const .symmetric(horizontal: 20, vertical: 20),
          trailing: AppIcon(icon: icon, isGlowing: false, color: color, bgColor: bgColor),
          title: Text(number, style: AppTextStyles.heading33Bold),
          subtitle: Text(
            subtitle,
            style: AppTextStyles.body16Regular.copyWith(color: AppColors.textSecondary),
          ),
        ),
      ),
    );
  }
}
