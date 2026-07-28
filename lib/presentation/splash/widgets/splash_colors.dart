import 'package:flutter/material.dart';

/// Brand colors for the Venting splash experience.
abstract final class SplashColors {
  static const Color backgroundTop = Color(0xFF0A0614);
  static const Color backgroundBottom = Color(0xFF12081F);

  static const Color purpleLight = Color(0xFFE0A6FF);
  static const Color purpleMid = Color(0xFFC45CFF);
  static const Color purpleDeep = Color(0xFF8B2FDB);
  static const Color purpleGlow = Color(0xFFB44DFF);

  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [purpleLight, purpleMid, purpleDeep],
  );

  static const LinearGradient progressGradient = LinearGradient(
    colors: [Color(0xFFD48BFF), purpleMid, purpleDeep],
  );
}
