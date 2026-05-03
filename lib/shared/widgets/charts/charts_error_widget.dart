import 'package:flutter/material.dart';
import '../feadback/error_widget.dart';

import '../../../core/extensions/context_extensions.dart';

class ChartsErrorWidget extends StatelessWidget {
  const ChartsErrorWidget({super.key, required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isDesktop
          ? context.width * .39
          : context.isTablet
          ? context.width * .6
          : context.width * .9,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Card(
          key: const ValueKey('error'),
          child: Center(
            child: AppErrorsWidget(message: message, onRetry: onRetry),
          ),
        ),
      ),
    );
  }
}
