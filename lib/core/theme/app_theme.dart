import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: .dark,

    // 🌙 Background
    scaffoldBackgroundColor: AppColors.primaryBackground,

    // 🎨 Color Scheme (M3 صح)
    colorScheme: const .dark(
      primary: AppColors.primaryAccent,
      secondary: AppColors.secondaryAccent,
      surface: AppColors.surface,
      error: AppColors.danger,

      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: AppColors.textPrimary,
      onError: Colors.white,
    ),

    // 🧱 Card (Glass Effect)
    cardTheme: CardThemeData(
      color: AppColors.surface.withValues(alpha: 0.75),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(16),
        side: const BorderSide(color: AppColors.border),
      ),
    ),

    // 🔘 Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryAccent,
        foregroundColor: Colors.white,
        padding: const .symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
    ),

    // ✏️ Inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: const TextStyle(color: AppColors.textSecondary),
      errorStyle: const TextStyle(color: AppColors.danger),
      labelStyle: const TextStyle(color: AppColors.textSecondary),

      border: OutlineInputBorder(
        borderRadius: .circular(14),
        borderSide: const BorderSide(color: AppColors.border),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: .circular(14),
        borderSide: const BorderSide(color: AppColors.danger, width: 1.5),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: .circular(14),
        borderSide: const BorderSide(color: AppColors.border),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: .circular(14),
        borderSide: const BorderSide(color: AppColors.primaryAccent, width: 1.5),
      ),
    ),

    // 📊 AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: .bold),
    ),

    // 🔲 Divider
    dividerColor: AppColors.border,

    // ☑ Checkbox
    checkboxTheme: CheckboxThemeData(
      fillColor: .resolveWith(
        (states) =>
            states.contains(WidgetState.selected) ? AppColors.primaryAccent : Colors.transparent,
      ),
      side: const BorderSide(color: AppColors.border),
    ),

    // 🎯 Icons
    iconTheme: const IconThemeData(color: AppColors.textPrimary),

    // 📂 Drawer Theme
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.secondaryBackground,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: .circular(20))),
    ),

    // 🧭 Navigation Drawer (Material 3)
    navigationDrawerTheme: NavigationDrawerThemeData(
      backgroundColor: AppColors.secondaryBackground,
      indicatorColor: AppColors.primaryAccent.withValues(alpha: 0.2),
      labelTextStyle: .resolveWith(
        (states) => TextStyle(
          color: states.contains(WidgetState.selected)
              ? AppColors.primaryAccent
              : AppColors.textSecondary,
          fontWeight: states.contains(WidgetState.selected) ? .bold : .normal,
        ),
      ),
      iconTheme: .resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected)
              ? AppColors.primaryAccent
              : AppColors.textSecondary,
        ),
      ),
    ),
  );
}
