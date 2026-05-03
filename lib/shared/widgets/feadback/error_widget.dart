import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AppErrorsWidget extends StatelessWidget {
  const AppErrorsWidget({super.key, required this.message, required this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        key: const ValueKey('error'),
        spacing: 10,
        mainAxisSize: .min,
        children: [
          const Icon(Icons.error_outline, size: 40, color: AppColors.danger),
          Text(message, textAlign: TextAlign.center),
          ElevatedButton(onPressed: onRetry, child: const Text('إعادة المحاولة')),
        ],
      ),
    );
  }
}
