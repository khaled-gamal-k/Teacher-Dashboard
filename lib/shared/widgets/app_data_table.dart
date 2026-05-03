import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/extensions/widgets_extensions.dart';
import '../../core/routers/routers_constants.dart';
import '../../core/utils/app_text_style.dart';

class AppDataTable extends StatelessWidget {
  const AppDataTable({super.key});

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
                Text('الأمتحانات الأخيرة', style: AppTextStyles.heading23Bold),
                TextButton(
                  onPressed: () {
                    context.go(Routers.students);
                  },
                  child: const Text('عرض الكل'),
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
                columns: const [
                  DataColumn(label: Text('اسم الامتحان')),
                  DataColumn2(label: Text('المجموعة'), size: .L),
                  DataColumn(label: Text('التاريخ')),
                  DataColumn2(label: Text('المتوسط'), numeric: true, size: .S),
                ],

                rows: List.generate(5, (index) {
                  final isGood = index % 2 == 0;

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
                      // ? navigate to details
                      // context.push(...)
                    },

                    cells: [
                      DataCell(Text("الباب الأول", style: AppTextStyles.body14Bold)),
                      const DataCell(Text("الاثنين والخميس 2")),
                      const DataCell(Text("2026-01-01")),
                      DataCell(
                        Text(
                          isGood ? "88%" : "72%",
                          style: AppTextStyles.body14Bold.copyWith(
                            color: isGood ? AppColors.success : AppColors.warning,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ).paddingSym(h: 20, v: 20),
      ),
    );
  }
}
