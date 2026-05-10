import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:teacher_dashboard/shared/widgets/app_text_field.dart';
import 'package:teacher_dashboard/shared/widgets/feadback/card_loading_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/student_model.dart';

class StudentsTable extends StatefulWidget {
  const StudentsTable({
    super.key,
    required this.students,
    required this.columns,
    this.onStudentTap,
    this.onSearch,
    this.isLoading = false,
    this.currentPage = 1,
    this.totalPages = 1,
    this.onNextPage,
    this.onPreviousPage,
  });

  final List<StudentModel> students;
  final List<String> columns;

  final ValueChanged<StudentModel>? onStudentTap;
  final ValueChanged<String>? onSearch;

  final int currentPage;
  final int totalPages;

  final bool isLoading;

  final VoidCallback? onNextPage;
  final VoidCallback? onPreviousPage;

  @override
  State<StudentsTable> createState() => _StudentsTableState();
}

class _StudentsTableState extends State<StudentsTable> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    _controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();

    _controller
      ..removeListener(_onSearchChanged)
      ..dispose();

    _focusNode.dispose();

    super.dispose();
  }

  void _onSearchChanged() {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch?.call(_controller.text.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = context.isMobile ? context.width * .95 : context.width * .8;
    return SizedBox(
      width: width,
      height: 550,
      child: Card(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _buildSearchField(),

            20.height,

            Expanded(
              child: widget.isLoading
                  ? Center(
                      child: ChartsLoadingWidget(size: width, color: AppColors.secondaryAccent),
                    )
                  : widget.students.isEmpty
                  ? Center(child: Text('لا يوجد بيانات', style: AppTextStyles.heading33Bold))
                  : _buildTable(),
            ),

            16.height,

            _buildPagination(),
          ],
        ).paddingSym(h: 20, v: 20),
      ),
    );
  }

  Widget _buildSearchField() {
    return AppTextField(
      hintText: 'البحث عن طالب بالأسم، الهاتف، أو المجموعة...',
      validator: (_) => null,
      prefixIcon: Icons.search_outlined,
      controller: _controller,
      focusNode: _focusNode,
      // onTap: _focusNode.requestFocus,
    );
  }

  Widget _buildTable() {
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      showCheckboxColumn: false,
      minWidth: 900,

      headingTextStyle: AppTextStyles.body16Bold,
      dataTextStyle: AppTextStyles.body14Regular,

      headingRowColor: WidgetStatePropertyAll(AppColors.primaryAccent.withValues(alpha: 0.08)),

      border: const TableBorder(horizontalInside: BorderSide(color: AppColors.border)),

      columns: widget.columns.map(_buildColumn).toList(),

      rows: widget.students.map(_buildRow).toList(),
    );
  }

  DataColumn2 _buildColumn(String title) {
    return DataColumn2(label: Text(title), size: .L);
  }

  DataRow _buildRow(StudentModel student) {
    return DataRow(
      color: WidgetStateProperty.resolveWith(_resolveRowColor),

      onSelectChanged: (_) {
        widget.onStudentTap?.call(student);
      },

      cells: [
        _buildCell(student.studentName ?? '', style: AppTextStyles.body14Bold),

        _buildCell(student.studentNumber ?? ''),

        _buildCell(student.studentClass ?? ''),

        _buildCell(
          '${(student.attendancePercentage ?? 0).toStringAsFixed(1)}%',
          style: _buildPercentageStyle(student.attendancePercentage ?? 0),
        ),

        _buildCell(
          '${student.avgScore ?? 0.toStringAsFixed(1)}%',
          style: _buildPercentageStyle(student.avgScore ?? 0),
        ),
      ],
    );
  }

  DataCell _buildCell(String value, {TextStyle? style}) {
    return DataCell(Text(value, style: style ?? AppTextStyles.body14Regular));
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          'الصفحة ${widget.currentPage} من ${widget.totalPages}',
          style: AppTextStyles.body14Regular,
        ),

        Row(
          children: [
            IconButton(
              onPressed: widget.currentPage > 1 ? widget.onPreviousPage : null,
              icon: const Icon(Icons.chevron_left_rounded),
            ),

            IconButton(
              onPressed: widget.currentPage < widget.totalPages ? widget.onNextPage : null,
              icon: const Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
      ],
    );
  }

  Color? _resolveRowColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return AppColors.surfaceLight.withValues(alpha: 0.4);
    }

    if (states.contains(WidgetState.pressed)) {
      return AppColors.surfaceLight;
    }

    return null;
  }

  TextStyle _buildPercentageStyle(double value) {
    late final Color color;

    if (value >= 85) {
      color = AppColors.success;
    } else if (value >= 60) {
      color = AppColors.warning;
    } else {
      color = AppColors.danger;
    }

    return AppTextStyles.body14Bold.copyWith(color: color);
  }
}
