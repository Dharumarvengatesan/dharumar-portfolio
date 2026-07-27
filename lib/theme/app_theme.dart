import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Colors ──────────────────────────────────────────────────
  static const Color bgColor = Color(0xFF0A0A1A);
  static const Color bgColorAlt = Color(0xFF0D0D20);
  static const Color accentCyan = Color(0xFF00D4FF);
  static const Color accentPurple = Color(0xFF7C3AED);
  static const Color textMain = Color(0xFFE2E8F0);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color glass = Color(0x0DFFFFFF); // white 5%
  static const Color glassBorder = Color(0x1AFFFFFF); // white 10%

  // ── Gradients ────────────────────────────────────────────────
  static const LinearGradient cyanPurpleGradient = LinearGradient(
    colors: [accentCyan, accentPurple],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient bgGradient = LinearGradient(
    colors: [bgColor, Color(0xFF0F0F2E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ── TextStyles ───────────────────────────────────────────────
  static TextStyle get displayLarge => GoogleFonts.inter(
        fontSize: 60,
        fontWeight: FontWeight.w800,
        color: textMain,
        height: 1.1,
      );

  static TextStyle get displayMedium => GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        color: textMain,
        height: 1.2,
      );

  static TextStyle get headingLarge => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: textMain,
      );

  static TextStyle get headingMedium => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textMain,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textMuted,
        height: 1.7,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: textMuted,
      );

  static TextStyle get labelStyle => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: accentCyan,
      );

  // ── Theme ────────────────────────────────────────────────────
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: bgColor,
        colorScheme: const ColorScheme.dark(
          primary: accentCyan,
          secondary: accentPurple,
          surface: bgColorAlt,
        ),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme,
        ),
      );
}
