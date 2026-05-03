import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
  });
  final String title;
  final Color? barColor;
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
                child: BarChart(
                  BarChartData(
                    alignment: .spaceEvenly,
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          getTitlesWidget: bottomTitleWidgets,
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
                    barGroups: [
                      _bulidCustomBar(1, 2),
                      _bulidCustomBar(2, 4),
                      _bulidCustomBar(3, 6),
                      _bulidCustomBar(4, 8),
                      _bulidCustomBar(5, 10),
                      _bulidCustomBar(6, 20),
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

  BarChartGroupData _bulidCustomBar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          gradient: gradientColors != null
              ? LinearGradient(colors: gradientColors!, begin: .bottomCenter, end: .topCenter)
              : null,
          width: 40,
          borderRadius: const .only(topLeft: .circular(10), topRight: .circular(10)),
        ),
      ],
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
