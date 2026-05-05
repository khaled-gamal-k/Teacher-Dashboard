import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/extensions/widgets_extensions.dart';
import '../../core/utils/app_text_style.dart';
import '../models/table_model.dart';

class AppDataTable extends StatelessWidget {
  const AppDataTable({super.key, this.tableModel, required this.title, this.onTap});
  final TableModel? tableModel;
  final String title;
  final VoidCallback? onTap;

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
                  onPressed: onTap,
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
                columns: tableModel?.headers.map((e) => DataColumn2(label: Text(e),size: .L)).toList() ?? [],
                rows:
                    tableModel?.rows.asMap().entries.map((entry) {
                      final index = entry.key;
                      final row = entry.value;

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
                          tableModel?.onRowTap?.call(index);
                        },
                        cells: List.generate(row.length, (cellIndex) {
                          final cell = row[cellIndex];

                          return DataCell(Text(cell, style: _getCellStyle(cellIndex, cell)));
                        }),
                      );
                    }).toList() ??
                    [],
              ),
            ),
          ],
        ).paddingSym(h: 20, v: 20),
      ),
    );
  }

  TextStyle _getCellStyle(int index, String value) {
    if (index == 3) {
      final score = double.tryParse(value) ?? 0;

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

    if (index == 0) {
      return AppTextStyles.body14Bold;
    }

    return AppTextStyles.body14Regular;
  }
}
