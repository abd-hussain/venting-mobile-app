import 'package:flutter/material.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

abstract final class ListenerProfileTheme {
  static const cardFill = Color(0xFF1C1826);
  static const cardBorder = Color(0xFF2A2238);
  static const muted = Color(0xFF9B93AB);
  static const success = Color(0xFF22C55E);
  static const gold = Color(0xFFFBBF24);
  static const accent = SplashColors.purpleMid;

  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [SplashColors.backgroundTop, SplashColors.backgroundBottom],
  );

  static const headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2A1848), Color(0xFF1C1826)],
  );
}
