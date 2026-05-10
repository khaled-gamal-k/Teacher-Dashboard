import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, required this.sidebar, required this.body, this.topBar});
  final Widget sidebar;
  final Widget body;
  final PreferredSizeWidget? topBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: sidebar),
      appBar: topBar,
      body: body,
    );
  }
}
