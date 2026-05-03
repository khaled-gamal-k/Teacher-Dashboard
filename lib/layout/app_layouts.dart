import 'package:flutter/material.dart';

import '../core/extensions/context_extensions.dart';
import 'responsive/desktop_layout.dart';
import 'responsive/mobile_layout.dart';
import 'responsive/tablet_layout.dart';
import 'sidebar/app_sidebar.dart';

class AppLayouts extends StatelessWidget {
  const AppLayouts({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return DesktopLayout(body: child, sidebar: const AppSidebar());
    }

    if (context.isTablet) {
      return TabletLayout(body: child, sidebar: const AppSidebar(isCompact: true,));
    }

    return MobileLayout(body: child, sidebar: const AppSidebar());
  }
}
