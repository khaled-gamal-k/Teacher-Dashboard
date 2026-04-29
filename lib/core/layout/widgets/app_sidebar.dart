import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:teacher_dashboard/core/constants/app_colors.dart';
import 'package:teacher_dashboard/core/extensions/context_extensions.dart';
import 'package:teacher_dashboard/core/extensions/widgets_extensions.dart';
import 'package:teacher_dashboard/core/utils/app_helpers.dart';

import '../../shared/widgets/app_icon.dart';
import '../../utils/app_text_style.dart';
import 'sidebar_item.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key, this.isCompact = false});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;

    return Container(
      alignment: .center,
      width: isCompact ? 70 : 250,
      decoration: BoxDecoration(
        border: .fromSTEB(end: const BorderSide(width: .1, color: AppColors.border)),
        color: AppColors.secondaryBackground,
      ),
      child: Column(
        children: [
          20.height,

          if (!isCompact) ..._buildSideBarHeader(context),

          _buildSideBarBody(location),
        ],
      ),
    );
  }

  Widget _buildSideBarBody(String location) {
    return Expanded(
      child: ListView.builder(
        itemCount: AppHelpers.sideBarItems.length,
        itemBuilder: (context, index) {
          final item = AppHelpers.sideBarItems[index];
          final isSelected = location.startsWith(item.route);

          return SidebarItem(
            item: item,
            isCompact: isCompact,
            isSelected: isSelected,
            onTap: () {
              if (context.isMobile) context.pop();
              context.go(item.route);
            },
          );
        },
      ),
    );
  }

  List<Widget> _buildSideBarHeader(BuildContext context) {
    return [
      Align(
        alignment: .centerStart,
        child: ListTile(
          leading: AppIcon(
            icon: FontAwesomeIcons.graduationCap,
            isGlowing: false,
            color: Colors.white,
            bgColor: AppColors.primaryAccent.withValues(alpha: 0.7),
          ),
          title: Text('Dashboard', style: AppTextStyles.body16Bold),
          subtitle: Text(
            'Teacher',
            style: AppTextStyles.body16Regular.copyWith(color: AppColors.textSecondary),
          ),
        ),
      ),
      const Divider(thickness: .5),
    ];
  }
}
