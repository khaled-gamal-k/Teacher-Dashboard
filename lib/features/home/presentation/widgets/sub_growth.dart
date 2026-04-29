import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:teacher_dashboard/core/constants/app_colors.dart';
import 'package:teacher_dashboard/core/extensions/widgets_extensions.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/app_text_style.dart';

class SubGrowth extends StatelessWidget {
  const SubGrowth({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isDesktop
          ? context.width * .4
          : context.isTablet
          ? context.width * .8
          : context.width * .9,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Card(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 20,
            children: [
              Text('نمو الأشتراكات', style: AppTextStyles.body16Bold),
              Flexible(
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        axisNameWidget: Text(
                          '${DateTime.now().year}',
                          style: AppTextStyles.body16Regular,
                        ),
                        sideTitles: SideTitles(
                          getTitlesWidget: bottomTitleWidgets,
                          showTitles: true,
                          interval: 1,
                        ),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: true, interval: 2),
                      ),
                    ),
                    borderData: FlBorderData(
                      border: const Border(
                        left: BorderSide(color: AppColors.textSecondary),
                        bottom: BorderSide(color: AppColors.textSecondary),
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
                          FlSpot(4, 3),
                          FlSpot(6, 8),
                          FlSpot(8, 6),
                        ],
                        isCurved: true,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryAccent.withValues(alpha: 0.2),
                              AppColors.secondaryAccent.withValues(alpha: 0.2),
                            ],
                          ),
                        ),
                        gradientArea: .wholeChart,
                        gradient: const LinearGradient(
                          colors: [AppColors.primaryAccent, AppColors.secondaryAccent],
                        ),
                        barWidth: 4,
                      ),
                    ],
                    minX: 1,
                    minY: 0,
                  ),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                ),
              ),
            ],
          ).paddingSym(h: 30, v: 30),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = AppTextStyles.body13Bold;
    String text = switch (value.toInt()) {
      1 => 'يناير',
      2 => 'فبراير',
      3 => 'مارس',
      4 => 'ابريل',
      5 => 'مايو',
      6 => 'يونيو',
      7 => 'يوليو',
      8 => 'اغسطس',
      9 => 'سبتمبر',
      10 => 'اكتوبر',
      11 => 'نوفمبر',
      12 => 'ديسمبر',
      _ => '',
    };
    return Text(text, style: style, textAlign: .center);
  }
}
