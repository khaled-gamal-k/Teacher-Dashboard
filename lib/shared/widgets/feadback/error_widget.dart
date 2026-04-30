import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/widgets_extensions.dart';
import '../../../core/utils/app_text_style.dart';

class ErrorsWidget extends StatelessWidget {
  const ErrorsWidget({super.key, required this.message, required this.onPressed});

  final String message;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: context.colors.error),
            16.height,
            Text(message, style: AppTextStyles.heading23Bold, textAlign: TextAlign.center),
            16.height,
            ElevatedButton(onPressed: onPressed, child: const Text('أعد المحاولة')),
          ],
        ).paddingAll(16.0),
      ),
    );
  }
}
