import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/strings_extensions.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../shared/models/charts_model.dart';
import '../../../../shared/widgets/charts/app_line_chart.dart';
import '../../../../shared/widgets/feadback/card_error_widget.dart';
import '../../../../shared/widgets/feadback/card_loading_widget.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class AttendancePerMonthChatrs extends StatelessWidget {
  const AttendancePerMonthChatrs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, (List<ChartsModel>?, String?)>(
      selector: (state) => (state.attendance, state.attendanceError),
      builder: (context, d) {
        final data = d.$1;
        final error = d.$2;

        if (error.isNotNullOrEmpty && data == null) {
          return ChartsErrorWidget(
            message: error!,
            onRetry: () => context.read<HomeCubit>().loadAttendance(),
          );
        }
        if (data == null) {
          return const ChartsLoadingWidget(color: AppColors.warning);
        }
        return AppLineChart(
          key: const ValueKey('content'),
          title: 'اتجاه الحضور',
          gradientColors: const [AppColors.warning, AppColors.expired],
          bottomTitleWidget: AppHelpers.bottomMonthWidget,
          data: data,
        );
      },
    );
  }
}
