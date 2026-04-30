import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.sidebar, required this.body, this.topBar});

  final Widget sidebar;
  final Widget body;
  final Widget? topBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          sidebar,
          Expanded(
            child: Column(
              children: [
                ?topBar,
                Expanded(child: body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
