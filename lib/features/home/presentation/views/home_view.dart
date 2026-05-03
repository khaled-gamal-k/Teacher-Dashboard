import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/widgets_extensions.dart';

import '../../../../core/network/supabase_database_config.dart';
import '../../../../shared/widgets/charts/app_bar_chart.dart';
import '../../../../shared/widgets/app_data_table.dart';
import '../widgets/attendance_per_month_chatrs.dart';
import '../widgets/stats_section.dart';
import '../widgets/students_growth_chatrs.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseDatabaseConfig().fetchRPC('dashboard');
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
              StudentsGrowthChatrs(),
              AttendancePerMonthChatrs(),
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
