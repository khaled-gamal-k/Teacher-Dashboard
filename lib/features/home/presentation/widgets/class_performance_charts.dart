import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/strings_extensions.dart';
import '../../../../shared/widgets/charts/app_bar_chart.dart';
import '../../../../shared/widgets/charts/charts_error_widget.dart';
import '../../../../shared/widgets/charts/charts_loading_widget.dart';
import '../../data/models/class_performance_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class ClassPerformanceCharts extends StatelessWidget {
  const ClassPerformanceCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, (List<ClassPerformanceModel>?, String?)>(
      selector: (state) => (state.performance, state.performanceError),
      builder: (context, d) {
        final data = d.$1;
        final error = d.$2;

        if (error.isNotNullOrEmpty && data == null) {
          return ChartsErrorWidget(
            message: error!,
            onRetry: () => context.read<HomeCubit>().loadPerformance(),
          );
        }
        if (data == null) {
          return const ChartsLoadingWidget(color: Color(0xFF7F00FF));
        }
        return AppBarChart(
          title: 'أداء المجموعات',
          gradientColors: const [AppColors.primaryAccent, AppColors.secondaryAccent],
          classesPerformance: data,
        );
      },
    );
  }
}
