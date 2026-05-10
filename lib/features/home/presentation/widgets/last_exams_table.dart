import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacher_dashboard/features/home/data/models/last_exams_model.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_text_style.dart';

class LastExamsTable extends StatelessWidget {
  const LastExamsTable({super.key, this.examsModel, required this.title, required this.columns});
  final List<LastExamsModel>? examsModel;
  final List<String> columns;
  final String title;

  double _getWidth(BuildContext context) {
    if (context.isDesktop) return context.width * .39;
    if (context.isTablet) return context.width * .6;
    return context.width * .9;
  }

  @override
  Widget build(BuildContext context) {
    final width = _getWidth(context);

    return SizedBox(
      width: width,
      height: 400,
      child: Card(
        child: Column(
          spacing: 20,
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(title, style: AppTextStyles.heading23Bold),
                TextButton(
                  onPressed: () {
                    // TODO: navigate to all exams
                  },
                  child: Text(
                    'عرض الكل',
                    style: AppTextStyles.body14Regular.copyWith(color: AppColors.primaryAccent),
                  ),
                ),
              ],
            ),

            Expanded(
              child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                headingTextStyle: AppTextStyles.body16Bold,
                dataTextStyle: AppTextStyles.body14Regular,
                headingRowColor: WidgetStatePropertyAll(
                  AppColors.primaryAccent.withValues(alpha: 0.08),
                ),
                showCheckboxColumn: false,
                border: const TableBorder(horizontalInside: BorderSide(color: AppColors.border)),
                columns: columns.map((e) => DataColumn2(label: Text(e), size: .L)).toList(),
                rows: examsModel!.map((exam) {
                  final formattedDate = DateFormat.yMMMMd(
                    'ar',
                  ).format(DateTime.parse(exam.examDate ?? ''));
                  final formattedTime = _formatTime(exam.classTime ?? '');

                  return DataRow(
                    color: .resolveWith<Color?>((states) {
                      if (states.contains(WidgetState.hovered)) {
                        return AppColors.surfaceLight.withValues(alpha: 0.4);
                      }
                      if (states.contains(WidgetState.pressed)) {
                        return AppColors.surfaceLight;
                      }
                      return null;
                    }),
                    onSelectChanged: (_) {
                      // TODO: navigate to exam
                    },
                    cells: [
                      DataCell(Text(exam.examName ?? '', style: AppTextStyles.body14Bold)),
                      DataCell(
                        Text(
                          '${exam.className}\n$formattedTime',
                          style: AppTextStyles.body14Regular,
                        ),
                      ),
                      DataCell(Text(formattedDate, style: AppTextStyles.body14Regular)),
                      DataCell(
                        Text(
                          '${(exam.avgScore ?? 0).toStringAsFixed(0)}%',
                          style: _getCellStyle(exam.avgScore ?? 0),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ).paddingSym(h: 20, v: 20),
      ),
    );
  }

  TextStyle _getCellStyle(double score) {
    Color color;
    if (score >= 85) {
      color = AppColors.success;
    } else if (score >= 60) {
      color = AppColors.warning;
    } else {
      color = AppColors.danger;
    }

    return AppTextStyles.body14Bold.copyWith(color: color);
  }

  String _formatTime(String time) {
    DateTime? parsedTime;

    try {
      parsedTime = DateFormat.Hm('en').parse(time);
    } catch (_) {
      parsedTime = null;
    }

    final formattedTime = parsedTime != null ? DateFormat.jm('ar').format(parsedTime) : '-';
    return formattedTime;
  }
}
