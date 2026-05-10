import 'package:flutter/material.dart';

import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../shared/widgets/page_header_widget.dart';
import '../widgets/attendance_per_month_chatrs.dart';
import '../widgets/class_performance_charts.dart';
import '../widgets/last_exams_bloc.dart';
import '../widgets/stats_section.dart';
import '../widgets/students_growth_chatrs.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: .center,
        children: [
          const PageHeaderWidget(
            title: 'الرئيسية',
            subtitle: 'نظرة عامة على نظام إدارة الدروس الخصوصية',
          ),
          const StatsSection(),
          30.height,
          const Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: .center,
            children: [
              StudentsGrowthChatrs(),
              AttendancePerMonthChatrs(),
              LastExamsBloc(),
              ClassPerformanceCharts(),
            ],
          ),
        ],
      ).paddingSym(h: 10, v: 20),
    );
  }
}
