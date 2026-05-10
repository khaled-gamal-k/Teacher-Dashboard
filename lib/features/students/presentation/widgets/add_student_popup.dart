import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teacher_dashboard/core/extensions/strings_extensions.dart';
import 'package:teacher_dashboard/core/extensions/widgets_extensions.dart';
import 'package:teacher_dashboard/core/utils/app_text_style.dart';
import 'package:teacher_dashboard/shared/widgets/app_button.dart';
import 'package:teacher_dashboard/shared/widgets/app_text_field.dart';

import '../../data/models/add_student_model.dart';
import '../../data/models/classes_model.dart';

class AddStudentDialog extends StatefulWidget {
  const AddStudentDialog({super.key, required this.classes});

  final List<ClassesModel> classes;

  @override
  State<AddStudentDialog> createState() => _AddStudentDialogState();
}

class _AddStudentDialogState extends State<AddStudentDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _numberController;
  late final TextEditingController _parentNumberController;

  late final FocusNode _nameNode;
  late final FocusNode _numberNode;
  late final FocusNode _parentNode;

  final _formKey = GlobalKey<FormState>();

  String? _selectedClassId;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _parentNumberController = TextEditingController();

    _nameNode = FocusNode();
    _numberNode = FocusNode();
    _parentNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _parentNumberController.dispose();

    _nameNode.dispose();
    _numberNode.dispose();
    _parentNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      title: Text('إضافة طالب', style: AppTextStyles.heading23Bold),

      content: SingleChildScrollView(
        child: SizedBox(
          width: 500,

          child: Form(
            key: _formKey,

            child: Column(
              mainAxisSize: .min,

              children: [
                //? NAME
                AppTextField(
                  hintText: 'اسم الطالب',
                  controller: _nameController,
                  focusNode: _nameNode,
                  prefixIcon: Icons.person_outline,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isNullOrEmpty) {
                      return 'أدخل اسم الطالب';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                //! STUDENT NUMBER
                AppTextField(
                  hintText: 'رقم الطالب',
                  controller: _numberController,
                  focusNode: _numberNode,
                  prefixIcon: Icons.phone_outlined,
                  textInputAction: .next,
                  validator: (value) {
                    if (value.isNullOrEmpty) {
                      return 'أدخل رقم الطالب';
                    }

                    if (value!.trim().length < 11) {
                      return 'رقم الهاتف غير صحيح';
                    }

                    return null;
                  },
                ),

                16.height,

                //? PARENT NUMBER
                AppTextField(
                  hintText: 'رقم ولي الأمر',
                  controller: _parentNumberController,
                  focusNode: _parentNode,
                  prefixIcon: Icons.family_restroom_outlined,
                  textInputAction: .done,
                  validator: (value) {
                    if (value.isNullOrEmpty) {
                      return 'أدخل رقم ولي الأمر';
                    }

                    if (value!.trim().length < 11) {
                      return 'رقم الهاتف غير صحيح';
                    }

                    return null;
                  },
                ),

                16.height,

                //* CLASS
                DropdownButtonFormField<String>(
                  initialValue: _selectedClassId,
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: 'اختر المجموعة',
                    prefixIcon: const Icon(Icons.groups_2_outlined),

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                  ),

                  items: widget.classes.map((e) {
                    return DropdownMenuItem<String>(value: e.id, child: Text(e.name ?? ''));
                  }).toList(),

                  onChanged: (value) => setState(() => _selectedClassId = value),

                  validator: (value) {
                    if (value == null) return 'اختر المجموعة';
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      actionsPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text('إلغاء')),

        SizedBox(
          width: 140,

          child: AppButton(title: 'إضافة', onPressed: _onAddStudent),
        ),
      ],
    );
  }

  void _onAddStudent() {
    if (!_formKey.currentState!.validate()) return;

    context.pop(
      AddStudentModel(
        name: _nameController.text.trim(),
        number: _numberController.text.trim(),
        parentNumber: _parentNumberController.text.trim(),
        classId: _selectedClassId!,
      ),
    );
  }
}
