import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teacher_dashboard/core/constants/app_colors.dart';

import '../../../../shared/widgets/dashboard_card.dart';
import '../../../../shared/widgets/feadback/hover_widgets.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: .start,
      crossAxisAlignment: .start,
      spacing: 15,
      runSpacing: 15,
      children: [
        HoverScaleOpacity(
          isGlow: false,
          scale: 1.1,
          child: DashboardCard(
            icon: FontAwesomeIcons.graduationCap,
            number: '12255',
            subtitle: 'اجمالي الطلاب',
            color: AppColors.primaryAccent,
            bgColor: AppColors.primaryAccent.withValues(alpha: 0.2),
          ),
        ),
        HoverScaleOpacity(
          isGlow: false,
          scale: 1.1,
          child: DashboardCard(
            icon: FontAwesomeIcons.users,
            number: '55',
            subtitle: 'اجمالي المجموعات',
            color: AppColors.primaryAccent,
            bgColor: AppColors.primaryAccent.withValues(alpha: 0.2),
          ),
        ),
        HoverScaleOpacity(
          isGlow: false,
          scale: 1.1,
          child: DashboardCard(
            icon: FontAwesomeIcons.dollarSign,
            number: '33,558',
            subtitle: 'صافي الربح هذا الشهر',
            color: AppColors.secondaryAccent,
            bgColor: AppColors.secondaryAccent.withValues(alpha: 0.2),
          ),
        ),
        HoverScaleOpacity(
          isGlow: false,
          scale: 1.1,
          child: DashboardCard(
            icon: FontAwesomeIcons.check,
            number: '123',
            subtitle: 'حضور اليوم',
            color: AppColors.primaryAccent,
            bgColor: AppColors.primaryAccent.withValues(alpha: 0.2),
          ),
        ),
        HoverScaleOpacity(
          isGlow: false,
          scale: 1.1,
          child: DashboardCard(
            icon: FontAwesomeIcons.graduationCap,
            number: '98%',
            subtitle: 'متوسط النتائج',
            color: AppColors.nearExpiry,
            bgColor: AppColors.nearExpiry.withValues(alpha: 0.2),
          ),
        ),
      ],
    );
  }
}
