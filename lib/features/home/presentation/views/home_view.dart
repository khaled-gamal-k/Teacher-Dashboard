import 'package:flutter/material.dart';
import 'package:teacher_dashboard/core/extensions/widgets_extensions.dart';

import '../widgets/stats_section.dart';
import '../widgets/sub_growth.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: .center,
        children: [
          const StatsSection(),
          20.height,
          const Wrap(spacing: 20, runSpacing: 20, children: [SubGrowth(), SubGrowth()]),
        ],
      ).paddingSym(h: 20, v: 20),
    );
  }
}
