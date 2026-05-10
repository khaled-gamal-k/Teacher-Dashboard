import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/students_cubit.dart';
import '../cubit/students_state.dart';
import 'students_table.dart';

class StudentsTableBloc extends StatelessWidget {
  const StudentsTableBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCubit, StudentsState>(
      builder: (context, state) {
        return StudentsTable(
          students: state.students,

          columns: const [
            'الأسم',
            'رقم الهاتف',
            'المجموعه',
            'نسبه الحضور',
            // 'الدفع',
            'متوسط الامتحانات',
          ],

          isLoading: state.isLoading,
          currentPage: state.currentPage,
          totalPages: state.totalPages,

          onNextPage: () => context.read<StudentsCubit>().nextPage(),

          onPreviousPage: () => context.read<StudentsCubit>().previousPage(),

          onSearch: (query) => context.read<StudentsCubit>().search(query),

          onStudentTap: (student) => debugPrint(student.id),
        );
      },
    );
  }
}
