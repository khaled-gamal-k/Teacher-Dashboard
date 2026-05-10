import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/page_header_widget.dart';
import '../../data/models/add_student_model.dart';
import '../../data/models/classes_model.dart';
import '../cubit/students_cubit.dart';
import '../cubit/students_state.dart';
import '../widgets/add_student_popup.dart';
import '../widgets/students_table_bloc.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [_buildPageHeader(), const StudentsTableBloc()],
      ).paddingSym(h: 10, v: 20),
    );
  }

  Widget _buildPageHeader() {
    return BlocSelector<StudentsCubit, StudentsState, List<ClassesModel>?>(
      selector: (state) => state.classes,
      builder: (context, classes) {
        if (classes == null) return const Center(child: CircularProgressIndicator());
        return PageHeaderWidget(
          title: 'الطلاب',
          subtitle: 'إدارة جميع الطلاب والاشتراكات الشهرية',
          trailing: SizedBox(
            width: 150,
            child: AppButton(
              title: 'إضافة طالب',
              onPressed: classes.isEmpty
                  ? () {}
                  : () async {
                      final result = await showDialog<AddStudentModel>(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => AddStudentDialog(classes: classes),
                      );

                      if (result != null && context.mounted) {
                        context.read<StudentsCubit>().addStudent(result);
                      }
                    },
            ),
          ),
        );
      },
    );
  }
}
