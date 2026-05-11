import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../shared/models/sidebar_item_model.dart';
import '../routers/routers_constants.dart';
import 'app_text_style.dart';

class AppHelpers {
  static BoxShadow neonGlow(Color color) {
    return BoxShadow(color: color.withValues(alpha: .6), blurRadius: 10, spreadRadius: 1);
  }

  static Widget bottomMonthWidget(double value, TitleMeta meta) {
    final style = AppTextStyles.body13Bold;

    const months = [
      '',
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];

    return SideTitleWidget(
      meta: meta,
      child: Text(months[value.toInt()], style: style),
    );
  }

  static String formatTimeFrom24To12(String time) {
    DateTime? parsedTime;

    try {
      parsedTime = DateFormat.Hm('en').parse(time);
    } catch (_) {
      parsedTime = null;
    }

    final formattedTime = parsedTime != null ? DateFormat.jm('ar').format(parsedTime) : '-';
    return formattedTime;
  }

  static final sideBarItems = [
    Item(FontAwesomeIcons.chartPie, 'الرئيسية', Routers.home),
    Item(FontAwesomeIcons.graduationCap, 'الطلاب', Routers.students),
    Item(FontAwesomeIcons.users, 'المجموعات', Routers.groups),
    Item(FontAwesomeIcons.clipboardCheck, 'الحضور', Routers.attendance),
    Item(FontAwesomeIcons.bookOpen, 'الامتحانات', Routers.exams),
    Item(FontAwesomeIcons.sackDollar, 'المالية', Routers.finance),
    Item(FontAwesomeIcons.chartLine, 'التقارير', Routers.reports),
    Item(FontAwesomeIcons.gear, 'الإعدادات', Routers.settings),
  ];
}
