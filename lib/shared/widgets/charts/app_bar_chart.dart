import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:teacher_dashboard/features/home/data/models/class_performance_model.dart';
import '../../../core/utils/app_text_style.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/widgets_extensions.dart';

class AppBarChart extends StatelessWidget {
  const AppBarChart({
    super.key,
    required this.title,
    this.barColor,
    this.gradientColors,
    this.leftTitlesInterval,
    this.classesPerformance,
  });
  final String title;
  final Color? barColor;
  final List<Color>? gradientColors;
  final double? leftTitlesInterval;
  final List<ClassPerformanceModel>? classesPerformance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isDesktop
          ? context.width * .39
          : context.isTablet
          ? context.width * .6
          : context.width * .9,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Card(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 20,
            children: [
              Text(title, style: AppTextStyles.heading23Bold),
              Expanded(
                child: BarChart(
                  BarChartData(
                    alignment: .spaceEvenly,
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          getTitlesWidget: (value, meta) {
                            final style = AppTextStyles.body13Bold;
                            if (value.toInt() >= classesPerformance!.length) {
                              return const SizedBox();
                            }
                            final lable =
                                classesPerformance?[value.toInt()].className ??
                                'لم يتم التعرف على الصف';
                            return SideTitleWidget(
                              meta: meta,
                              child: Text(lable, style: style),
                            );
                          },
                          showTitles: true,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true, interval: leftTitlesInterval),
                      ),
                    ),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(color: AppColors.border),
                        bottom: BorderSide(color: AppColors.border),
                      ),
                    ),
                    barGroups: _buildBarGroups(),
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final point = classesPerformance![groupIndex].points[rodIndex];

                          return BarTooltipItem(
                            'الساعه ${point.x}:00\n${point.y}%',
                            const TextStyle(color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInExpo,
                ),
              ),
            ],
          ).paddingSym(h: 20, v: 20),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    if (classesPerformance == null) return [];

    return List.generate(classesPerformance!.length, (index) {
      final classItem = classesPerformance![index];

      return BarChartGroupData(
        x: index,
        barsSpace: 5,
        barRods: classItem.points.map((point) {
          return BarChartRodData(
            toY: point.y,
            width: 10,
            color: barColor,
            gradient: gradientColors != null
                ? LinearGradient(
                    colors: _buildGradientColors(point.x.toInt()),
                    begin: .bottomCenter,
                    end: .topCenter,
                  )
                : null,
            borderRadius: const .only(topLeft: .circular(6), topRight: .circular(6)),
          );
        }).toList(),
      );
    });
  }

  List<Color> _buildGradientColors(int index) {
    switch (index % 5) {
      case 0:
        return [const Color(0xFFFF9A44), const Color(0xFFFFD452)];

      case 2:
        return [const Color(0xFF43E97B), const Color(0xFF38F9D7)];

      case 3:
        return [const Color(0xFF7F00FF), const Color(0xFFE100FF)];

      default:
        return [AppColors.primaryAccent, AppColors.secondaryAccent];
    }
  }
}
