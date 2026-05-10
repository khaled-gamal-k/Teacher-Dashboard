import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/widgets_extensions.dart';
import '../../../core/utils/app_text_style.dart';
import '../../models/charts_model.dart';

class AppLineChart extends StatelessWidget {
  const AppLineChart({
    super.key,
    required this.title,
    this.data,
    this.lineColor,
    this.gradientColors,
    this.leftTitlesInterval,
    required this.bottomTitleWidget,
  });
  final String title;
  final Widget Function(double value, TitleMeta meta) bottomTitleWidget;
  final Color? lineColor;
  final List<Color>? gradientColors;
  final double? leftTitlesInterval;
  final List<ChartsModel>? data;

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
                          getTitlesWidget: bottomTitleWidget,
                          showTitles: true,
                          interval: 1,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true, interval: leftTitlesInterval),
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
                        spots: data!.map((e) => FlSpot(e.x ?? 0, e.y ?? 0)).toList(),
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
                        preventCurveOverShooting: true,
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
}
