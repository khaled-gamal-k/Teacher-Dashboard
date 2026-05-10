import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/strings_extensions.dart';
import 'last_exams_table.dart';
import '../../../../shared/widgets/feadback/card_error_widget.dart';
import '../../../../shared/widgets/feadback/card_loading_widget.dart';
import '../../data/models/last_exams_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class LastExamsBloc extends StatelessWidget {
  const LastExamsBloc({super.key});

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
        return LastExamsTable(
          title: 'الأمتحانات الأخيرة',
          examsModel: data,
          columns: const ['أسم الامتحان', 'المجموعة', 'التاريخ', 'المتوسط'],
        );
      },
    );
  }
}
