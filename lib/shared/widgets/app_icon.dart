import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/constants/app_colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.size = 22,
    this.icon,
    this.isGlowing = true,
    this.color,
    this.bgColor,
    this.padding = 12,
  });

  final double size;
  final double padding;
  final Color? color;
  final Color? bgColor;
  final FaIconData? icon;
  final bool isGlowing;

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? AppColors.primaryAccent;
    final backgroundColor = bgColor ?? AppColors.surface;

    return Container(
      padding: .all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: .circular(16),
        boxShadow: isGlowing
            ? [BoxShadow(color: iconColor.withValues(alpha: 0.35), blurRadius: 14, spreadRadius: 1)]
            : null,
      ),
      child: FaIcon(icon ?? FontAwesomeIcons.circleQuestion, color: iconColor, size: size),
    );
  }
}
