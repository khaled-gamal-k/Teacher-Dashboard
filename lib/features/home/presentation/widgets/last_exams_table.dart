import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/extensions/strings_extensions.dart';
import '../../../../shared/models/table_model.dart';
import '../../../../shared/widgets/app_data_table.dart';
import '../../../../shared/widgets/charts/charts_error_widget.dart';
import '../../../../shared/widgets/charts/charts_loading_widget.dart';
import '../../data/models/last_exams_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class LastExamsTable extends StatelessWidget {
  const LastExamsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, (List<LastExamsModel>?, String?)>(
      selector: (state) => (state.exams, state.examsError),
      builder: (context, d) {
        final data = d.$1;
        final error = d.$2;

        if (error.isNotNullOrEmpty && data == null) {
          return ChartsErrorWidget(
            message: error!,
            onRetry: () => context.read<HomeCubit>().loadLastExams(),
          );
        }
        if (data == null) {
          return const ChartsLoadingWidget(color: Colors.yellowAccent);
        }

        if (data.isEmpty) {
          return const Center(child: Text('لا يوجد امتحانات'));
        }
        return AppDataTable(title: 'الأمتحانات الأخيرة', tableModel: buildExamTable(data));
      },
    );
  }

  TableModel buildExamTable(List<LastExamsModel> exams) {
    return TableModel(
      headers: ['أسم الامتحان', 'المجموعة', 'التاريخ', 'المتوسط'],
      rows: exams.map((e) {
        final formattedDate = DateFormat.yMMMMd('ar').format(DateTime.parse(e.examDate ?? ''));
        final formattedTime = _formatTime(e);
        return [
          e.examName ?? '',
          '${e.className}\n$formattedTime',
          formattedDate,
          (e.avgScore ?? 0).toStringAsFixed(0),
        ];
      }).toList(),
      onRowTap: (index) {
        //? TODO navigate to exam details
        debugPrint('Clicked exam $index');
      },
    );
  }

  String _formatTime(LastExamsModel e) {
    final timeString = e.classTime ?? '';

    DateTime? parsedTime;

    try {
      parsedTime = DateFormat.Hm('en').parse(timeString);
    } catch (_) {
      parsedTime = null;
    }

    final formattedTime = parsedTime != null ? DateFormat.jm('ar').format(parsedTime) : '-';
    return formattedTime;
  }
}
