import 'package:flutter/material.dart';
import 'package:teacher_dashboard/core/utils/app_text_style.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/app_helpers.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.focusNode,
    this.prefixIcon,
    this.isPassword,
    this.suffixIcon,
    this.onTap,
    this.textInputAction,
  });

  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool? isPassword;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode focusNode;
  final VoidCallback? onTap;

  final TextInputAction? textInputAction;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = widget.focusNode.hasFocus;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: .circular(15),
        boxShadow: isFocused ? [AppHelpers.neonGlow(AppColors.glowBlue)] : null,
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        validator: widget.validator,
        obscureText: widget.isPassword ?? false,
        textInputAction: widget.textInputAction,
        cursorColor: AppColors.primaryAccent,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyles.body16Regular.copyWith(color: AppColors.textSecondary),
          prefixIcon: widget.prefixIcon == null
              ? null
              : Icon(widget.prefixIcon, color: AppColors.textSecondary),
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
