import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teacher_dashboard/core/extensions/widgets_extensions.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/app_text_style.dart';

class AppTopbar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopbar({
    super.key,
    this.title = 'Dashboard',
    this.isCompact = false,
    this.actions,
    this.userName = 'Khaled',
    this.userEmail = 'khaled@email.com',
    this.imageUrl,
  });

  final String title;
  final bool isCompact;
  final List<Widget>? actions;

  final String userName;
  final String userEmail;
  final String? imageUrl;

  @override
  Size get preferredSize => const .fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.secondaryBackground,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: preferredSize.height,
          child: Row(
            children: [
              if (isCompact) ...[
                IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu_rounded),
                ),
                12.width,
              ],
              Expanded(child: Text(title, style: AppTextStyles.body19Bold)),

              if (isCompact) _buildCompactProfile() else _buildProfileTile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompactProfile() {
    return CircleAvatar(
      radius: 18,
      backgroundColor: AppColors.border,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null ? const Icon(Icons.person_rounded) : null,
    );
  }

  Widget _buildProfileTile() {
    return Container(
      padding: const .symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: .circular(14),
        border: .all(color: AppColors.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.border,
            backgroundImage: imageUrl != null ? CachedNetworkImageProvider(imageUrl!) : null,
            child: imageUrl == null ? const Icon(Icons.person_rounded) : null,
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            children: [
              Text(userName, style: AppTextStyles.body16Bold),
              Text(userEmail, style: AppTextStyles.body13Regular),
            ],
          ),
        ],
      ),
    );
  }
}
