import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtensions on Widget {
  Widget get center => Center(child: this);
  Widget paddingAll(double value) => Padding(padding: .all(value), child: this);
  Widget paddingSym({double h = 0, double v = 0}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
    child: this,
  );
  Widget paddingTop(double value) => Padding(
    padding: EdgeInsets.only(top: value),
    child: this,
  );
  Widget paddingBottom(double value) => Padding(
    padding: EdgeInsets.only(bottom: value),
    child: this,
  );
  Widget paddingRight(double value) => Padding(
    padding: EdgeInsets.only(right: value),
    child: this,
  );
  Widget paddingLeft(double value) => Padding(
    padding: EdgeInsets.only(left: value),
    child: this,
  );

  Widget onTap(VoidCallback onTap) => InkWell(onTap: onTap, child: this);
  Widget onPressed(VoidCallback onTap) => GestureDetector(onTap: onTap, child: this);
}

extension NumExtensions on num {
  SizedBox get height => SizedBox(height: toDouble().h);
  SizedBox get width => SizedBox(width: toDouble().w);
}
