import 'package:flutter/material.dart';

class PulseGlowContainer extends StatelessWidget {
  const PulseGlowContainer({super.key, required this.color, this.size = 40});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: .circle,
        color: color.withValues(alpha: .8),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: .7), blurRadius: 60, spreadRadius: 40),
        ],
      ),
    );
  }
}
