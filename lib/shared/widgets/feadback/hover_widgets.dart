import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/app_helpers.dart';

class HoverScaleOpacity extends StatefulWidget {
  const HoverScaleOpacity({
    super.key,
    required this.child,
    this.onTap,
    this.scale = 1.05,
    this.isGlow = true,
    this.opacity = 0.85,
    this.color = AppColors.glowBlue,
    this.duration = const Duration(milliseconds: 200),
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool isGlow;
  final double scale;
  final double opacity;
  final Color color;
  final Duration duration;

  @override
  State<HoverScaleOpacity> createState() => _HoverScaleOpacityState();
}

class _HoverScaleOpacityState extends State<HoverScaleOpacity> {
  final ValueNotifier<bool> _isHover = ValueNotifier(false);

  @override
  void dispose() {
    _isHover.dispose();
    super.dispose();
  }

  void _onEnter(_) => _isHover.value = true;
  void _onExit(_) => _isHover.value = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,

      child: GestureDetector(
        onTap: widget.onTap,

        child: ValueListenableBuilder<bool>(
          valueListenable: _isHover,

          builder: (_, isHover, child) {
            return Animate(
              target: isHover ? 1 : 0,

              effects: [
                ScaleEffect(
                  begin: const Offset(1, 1),
                  end: Offset(widget.scale, widget.scale),
                  duration: widget.duration,
                  curve: Curves.easeOut,
                ),

                FadeEffect(begin: widget.opacity, end: 1, duration: widget.duration),

                CustomEffect(
                  duration: widget.duration,
                  builder: (context, value, child) {
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow: widget.isGlow && isHover
                            ? [AppHelpers.neonGlow(widget.color)]
                            : [],
                      ),
                      child: child,
                    );
                  },
                ),
              ],

              child: child!,
            );
          },

          child: widget.child,
        ),
      ),
    );
  }
}
