import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/models/sidebar_item_model.dart';
import '../routers/routers_constants.dart';

class AppHelpers {
  static BoxShadow neonGlow(Color color) {
    return BoxShadow(color: color.withValues(alpha: .6), blurRadius: 10, spreadRadius: 1);
  }

  static final sideBarItems = [
    Item(FontAwesomeIcons.chartPie, 'لوحة التحكم', Routers.home),
    Item(FontAwesomeIcons.graduationCap, 'الطلاب', Routers.students),
    Item(FontAwesomeIcons.users, 'المجموعات', Routers.groups),
    Item(FontAwesomeIcons.clipboardCheck, 'الحضور', Routers.attendance),
    Item(FontAwesomeIcons.bookOpen, 'الامتحانات', Routers.exams),
    Item(FontAwesomeIcons.sackDollar, 'المالية', Routers.finance),
    Item(FontAwesomeIcons.chartLine, 'التقارير', Routers.reports),
    Item(FontAwesomeIcons.gear, 'الإعدادات', Routers.settings),
  ];
}
