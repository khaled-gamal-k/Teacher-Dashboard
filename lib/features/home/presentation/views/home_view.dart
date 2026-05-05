import 'package:flutter/material.dart';
import '../../../../core/extensions/widgets_extensions.dart';

import '../../../../core/network/supabase_database_config.dart';
import '../widgets/attendance_per_month_chatrs.dart';
import '../widgets/class_performance_charts.dart';
import '../widgets/last_exams_table.dart';
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
              LastExamsTable(),
              ClassPerformanceCharts(),
            ],
          ),
        ],
      ).paddingSym(h: 10, v: 20),
    );
  }
}
