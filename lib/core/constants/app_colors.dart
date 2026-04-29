import 'package:flutter/material.dart';

abstract class AppColors {
  // 🌙 Backgrounds
  static const Color primaryBackground = Color(0xFF0B0F18);
  static const Color secondaryBackground = Color(0xFF0F172A);

  // 🎯 Accents
  static const Color primaryAccent = Color(0xFF3B82F6);
  static const Color secondaryAccent = Color(0xFF22D3EE);

  // 📝 Text & Icons
  static const Color textPrimary = Color(0xFFE5E7EB);
  static const Color textSecondary = Color(0xFF94A3B8);

  // 🧱 Surfaces / Cards
  static const Color surface = Color(0xFF101621);
  static const Color surfaceLight = Color(0xFF1E293B);

  // 🔲 Borders
  static const Color border = Color(0xFF1F2937);

  // 💡 Glow Effects
  static const Color glowBlue = Color(0x663B82F6);
  static const Color glowCyan = Color(0x6622D3EE);

  // 💰 Financial Colors
  static const Color success = Color(0xFF22C55E);
  static const Color danger = Color(0xFFF43F5E);
  static const Color warning = Color(0xFFF59E0B);

  // 📊 Status Colors
  static const Color active = primaryAccent;
  static const Color inactive = Color(0xFF64748B);

  // 🧠 Subscription States
  static const Color nearExpiry = warning;
  static const Color expired = danger;

  // Gradient Colors
  static const Color gradientStart = Color(0xFF3B82F6);
  static const Color gradientEnd = Color(0xFF22D3EE);
}
