import 'package:flutter/material.dart';
import 'package:teacher_dashboard/core/constants/app_colors.dart';
import 'package:teacher_dashboard/core/extensions/widgets_extensions.dart';

import '../../../../core/shared/widgets/app_bar_chart.dart';
import '../../../../core/shared/widgets/app_data_table.dart';
import '../widgets/stats_section.dart';
import '../../../../core/shared/widgets/app_line_chart.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: .center,
        children: [
          const StatsSection(),
          20.height,
          const Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: .center,
            children: [
              AppLineChart(
                title: 'اتجاه الحضور',
                leftTitlesInterval: 1,
                gradientColors: [AppColors.expired, AppColors.nearExpiry],
              ),
              AppLineChart(title: 'اجمالي الطلاب', lineColor: AppColors.success),
              AppDataTable(),
              AppBarChart(
                title: 'أداء المجموعات',
                gradientColors: [AppColors.primaryAccent, AppColors.secondaryAccent],
              ),
            ],
          ),
        ],
      ).paddingSym(h: 10, v: 20),
    );
  }
}
