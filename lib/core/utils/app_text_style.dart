import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

abstract class AppTextStyles {
  // ================== Headings ==================

  static final heading48Regular = GoogleFonts.cairo(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final heading48Bold = GoogleFonts.cairo(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final heading40Regular = GoogleFonts.cairo(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final heading40Bold = GoogleFonts.cairo(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final heading33Regular = GoogleFonts.cairo(
    fontSize: 33,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final heading33Bold = GoogleFonts.cairo(
    fontSize: 33,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final heading28Regular = GoogleFonts.cairo(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final heading28Bold = GoogleFonts.cairo(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final heading23Regular = GoogleFonts.cairo(
    fontSize: 23,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final heading23Bold = GoogleFonts.cairo(
    fontSize: 23,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // ================== Body ==================

  static final body19Regular = GoogleFonts.cairo(
    fontSize: 19,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final body19Bold = GoogleFonts.cairo(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final body16Regular = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final body16SemiBold = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final body16Bold = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
  static final body14Bold = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
  static final body14Regular = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static final body14SemiBold = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final body13Regular = GoogleFonts.cairo(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static final body13SemiBold = GoogleFonts.cairo(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static final body13Bold = GoogleFonts.cairo(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static final body11Regular = GoogleFonts.cairo(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final body11Bold = GoogleFonts.cairo(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // ================== Special ==================

  static final profit = GoogleFonts.cairo(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.success,
  );

  static final loss = GoogleFonts.cairo(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.danger,
  );

  static final warning = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.warning,
  );

  static final accent = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryAccent,
  );
}
