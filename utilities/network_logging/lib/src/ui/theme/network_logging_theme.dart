import 'package:flutter/material.dart';

/// Simple theme helper for network logging UI components
/// Replaces Duplo theme functionality with Material Design theming
class NetworkLoggingTheme {
  static const _primaryColor = Color(0xFF2563EB); // Blue
  static const _successColor = Color(0xFF10B981); // Green
  static const _errorColor = Color(0xFFEF4444); // Red
  static const _warningColor = Color(0xFFF59E0B); // Amber

  /// Get colors based on current theme brightness
  static NetworkLoggingColors colors(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? _darkColors : _lightColors;
  }

  /// Get text styles based on current theme
  static NetworkLoggingTextStyles textStyles(BuildContext context) {
    final theme = Theme.of(context);
    return NetworkLoggingTextStyles(theme.textTheme);
  }

  static const _lightColors = NetworkLoggingColors(
    // Background colors
    bgPrimary: Color(0xFFFFFFFF),
    bgSecondary: Color(0xFFF8FAFC),
    bgTertiary: Color(0xFFF1F5F9),

    // Text colors
    textPrimary: Color(0xFF0F172A),
    textSecondary: Color(0xFF475569),
    textTertiary: Color(0xFF94A3B8),

    // Foreground colors
    fgPrimary: Color(0xFF0F172A),
    fgSecondary: Color(0xFF475569),
    fgTertiary: Color(0xFF94A3B8),

    // Utility colors
    brand500: _primaryColor,
    success500: _successColor,
    error500: _errorColor,
    warning500: _warningColor,
  );

  static const _darkColors = NetworkLoggingColors(
    // Background colors
    bgPrimary: Color(0xFF0F172A),
    bgSecondary: Color(0xFF1E293B),
    bgTertiary: Color(0xFF334155),

    // Text colors
    textPrimary: Color(0xFFF8FAFC),
    textSecondary: Color(0xFFCBD5E1),
    textTertiary: Color(0xFF94A3B8),

    // Foreground colors
    fgPrimary: Color(0xFFF8FAFC),
    fgSecondary: Color(0xFFCBD5E1),
    fgTertiary: Color(0xFF94A3B8),

    // Utility colors
    brand500: _primaryColor,
    success500: _successColor,
    error500: _errorColor,
    warning500: _warningColor,
  );
}

/// Color scheme for network logging UI
class NetworkLoggingColors {
  const NetworkLoggingColors({
    required this.bgPrimary,
    required this.bgSecondary,
    required this.bgTertiary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.fgPrimary,
    required this.fgSecondary,
    required this.fgTertiary,
    required this.brand500,
    required this.success500,
    required this.error500,
    required this.warning500,
  });

  final Color bgPrimary;
  final Color bgSecondary;
  final Color bgTertiary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color fgPrimary;
  final Color fgSecondary;
  final Color fgTertiary;
  final Color brand500;
  final Color success500;
  final Color error500;
  final Color warning500;
}

/// Text styles for network logging UI
class NetworkLoggingTextStyles {
  const NetworkLoggingTextStyles(this._textTheme);

  final TextTheme _textTheme;

  TextStyle get textXs =>
      _textTheme.bodySmall?.copyWith(fontSize: 12) ??
      const TextStyle(fontSize: 12);

  TextStyle get textSm =>
      _textTheme.bodySmall?.copyWith(fontSize: 14) ??
      const TextStyle(fontSize: 14);

  TextStyle get textMd =>
      _textTheme.bodyMedium?.copyWith(fontSize: 16) ??
      const TextStyle(fontSize: 16);

  TextStyle get textLg =>
      _textTheme.bodyLarge?.copyWith(fontSize: 18) ??
      const TextStyle(fontSize: 18);

  TextStyle get textXl =>
      _textTheme.headlineSmall?.copyWith(fontSize: 20) ??
      const TextStyle(fontSize: 20);
}
