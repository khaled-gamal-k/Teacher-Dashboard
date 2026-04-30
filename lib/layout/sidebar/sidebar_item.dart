import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teacher_dashboard/core/constants/app_colors.dart';
import 'package:teacher_dashboard/core/utils/app_text_style.dart';

import '../../shared/models/sidebar_item_model.dart';

class SidebarItem extends StatefulWidget {
  const SidebarItem({
    super.key,
    required this.item,
    required this.isCompact,
    required this.isSelected,
    required this.onTap,
  });

  final Item item;
  final bool isCompact;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  final ValueNotifier<bool> _isHover = ValueNotifier(false);

  @override
  void dispose() {
    _isHover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.primaryAccent.withValues(alpha: 0.7);

    return ValueListenableBuilder<bool>(
      valueListenable: _isHover,
      builder: (context, isHover, _) {
        final isActive = widget.isSelected;

        return MouseRegion(
          onEnter: (_) => _isHover.value = true,
          onExit: (_) => _isHover.value = false,
          cursor: SystemMouseCursors.click,

          child: GestureDetector(
            onTap: widget.onTap,

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const .symmetric(horizontal: 10, vertical: 5),
              padding: const .symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isActive
                    ? activeColor
                    : isHover
                    ? AppColors.surfaceLight
                    : Colors.transparent,
              ),

              child: _buildSideItemBody(context, isActive),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSideItemBody(BuildContext context, bool isActive) {
    return Row(
      spacing: 12,
      children: [
        FaIcon(
          widget.item.icon,
          color: isActive ? Colors.white : AppColors.textSecondary,
          size: 18,
        ),

        if (!widget.isCompact)
          Expanded(
            child: Text(
              widget.item.label,
              style: isActive
                  ? AppTextStyles.body16Bold.copyWith(color: Colors.white)
                  : AppTextStyles.body16Regular.copyWith(color: AppColors.textSecondary),
            ),
          ),
      ],
    );
  }
}
