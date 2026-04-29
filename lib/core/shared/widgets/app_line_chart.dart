import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:teacher_dashboard/core/constants/app_colors.dart';
import 'package:teacher_dashboard/core/extensions/widgets_extensions.dart';

import '../../extensions/context_extensions.dart';
import '../../utils/app_text_style.dart';

class AppLineChart extends StatelessWidget {
  const AppLineChart({
    super.key,
    required this.title,
    this.lineColor,
    this.gradientColors,
    this.leftTitlesInterval,
  });
  final String title;
  final Color? lineColor;
  final List<Color>? gradientColors;
  final double? leftTitlesInterval;

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
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          getTitlesWidget: bottomTitleWidgets,
                          showTitles: true,
                          interval: 1,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true, interval: leftTitlesInterval ?? 2),
                      ),
                    ),
                    borderData: FlBorderData(
                      border: const Border(
                        left: BorderSide(color: AppColors.border),
                        bottom: BorderSide(color: AppColors.border),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      getDrawingHorizontalLine: (value) =>
                          const FlLine(color: AppColors.border, strokeWidth: .5),
                      getDrawingVerticalLine: (value) =>
                          const FlLine(color: AppColors.border, strokeWidth: .5),
                      verticalInterval: 1,
                      horizontalInterval: 2,
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(1, 1),
                          FlSpot(2, 5),
                          FlSpot(3, 3),
                          FlSpot(5, 8),
                          FlSpot(6, 6),
                        ],
                        isCurved: true,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(
                          show: gradientColors != null,
                          gradient: gradientColors != null
                              ? LinearGradient(
                                  colors: gradientColors!
                                      .map((color) => color.withValues(alpha: 0.2))
                                      .toList(),
                                )
                              : null,
                        ),
                        gradientArea: .wholeChart,
                        color: lineColor,
                        gradient: gradientColors != null
                            ? LinearGradient(colors: gradientColors!)
                            : null,
                        barWidth: 4,
                      ),
                    ],
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = AppTextStyles.body13Bold;

    const months = [
      '',
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];

    return SideTitleWidget(
      meta: meta,
      child: Text(months[value.toInt()], style: style),
    );
  }
}
