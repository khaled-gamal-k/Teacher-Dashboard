import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/strings_extensions.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../shared/models/charts_model.dart';
import '../../../../shared/widgets/charts/app_line_chart.dart';
import '../../../../shared/widgets/charts/charts_error_widget.dart';
import '../../../../shared/widgets/charts/charts_loading_widget.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class StudentsGrowthChatrs extends StatelessWidget {
  const StudentsGrowthChatrs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, (List<ChartsModel>?, String?)>(
      selector: (state) => (state.students, state.studentsError),
      builder: (context, d) {
        final data = d.$1;
        final error = d.$2;

        if (error.isNotNullOrEmpty && data == null) {
          return ChartsErrorWidget(
            message: error!,
            onRetry: () => context.read<HomeCubit>().loadStudents(),
          );
        }
        if (data == null) {
          return const ChartsLoadingWidget(color: AppColors.success);
        }
        return AppLineChart(
          key: const ValueKey('content'),
          title: 'اجمالي الطلاب',
          lineColor: AppColors.success,
          bottomTitleWidget: AppHelpers.bottomMonthWidget,
          data: data,
        );
      },
    );
  }
}
