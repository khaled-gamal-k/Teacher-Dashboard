import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/strings_extensions.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

import '../../../../shared/widgets/dashboard_card.dart';
import '../../../../shared/widgets/feadback/error_widget.dart';
import '../../../../shared/widgets/feadback/hover_widgets.dart';
import '../../data/models/dashboard_model.dart';
import 'shimmer_loading_widget.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, (DashboardModel?, String?)>(
      selector: (s) => (s.stats, s.statsError),
      builder: (context, data) {
        final stats = data.$1;
        final error = data.$2;

        if (error.isNotNullOrEmpty && stats == null) {
          return AppErrorsWidget(
            message: error!,
            onRetry: () => context.read<HomeCubit>().loadStats(),
          );
        }

        if (stats == null) {
          return const DashboardCardSkeleton();
        }

        return _buildContent(stats);
      },
    );
  }

  Widget _buildContent(DashboardModel stats) {
    final formatter = NumberFormat.compact();
    return Wrap(
      alignment: .start,
      crossAxisAlignment: .start,
      spacing: 15,
      runSpacing: 15,
      children: [
        _buildStatsCard(
          icon: FontAwesomeIcons.graduationCap,
          number: formatter.format(stats.studentsCount),
          subtitle: 'اجمالي الطلاب',
        ),
        _buildStatsCard(
          icon: FontAwesomeIcons.users,
          number: formatter.format(stats.classesCount),
          subtitle: 'اجمالي المجموعات',
        ),
        _buildStatsCard(
          icon: FontAwesomeIcons.dollarSign,
          number: formatter.format(stats.revenue),
          subtitle: 'صافي الربح هذا الشهر',
          isSecondary: true,
        ),
        _buildStatsCard(
          icon: FontAwesomeIcons.check,
          number: formatter.format(stats.attendanceToday),
          subtitle: 'حضور اليوم',
        ),
        _buildStatsCard(
          icon: FontAwesomeIcons.percent,
          number: '${stats.avgScore.toStringAsFixed(1)}%',
          subtitle: 'متوسط النتائج',
          isWarning: true,
        ),
      ],
    );
  }

  Widget _buildStatsCard({
    required FaIconData icon,
    required String number,
    required String subtitle,
    bool isSecondary = false,
    bool isWarning = false,
  }) {
    final color = isWarning
        ? AppColors.nearExpiry
        : isSecondary
        ? AppColors.secondaryAccent
        : AppColors.primaryAccent;

    return HoverScaleOpacity(
      isGlow: false,
      scale: 1.05,
      child: DashboardCard(
        icon: icon,
        number: number,
        subtitle: subtitle,
        color: color,
        bgColor: color.withValues(alpha: 0.2),
      ),
    );
  }
}
