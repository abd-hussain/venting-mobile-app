// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsGoogleFontsGen {
  const $AssetsGoogleFontsGen();

  /// File path: assets/google_fonts/GreatVibes-Regular.ttf
  String get greatVibesRegular => 'assets/google_fonts/GreatVibes-Regular.ttf';

  /// File path: assets/google_fonts/Inter-Bold.ttf
  String get interBold => 'assets/google_fonts/Inter-Bold.ttf';

  /// File path: assets/google_fonts/Inter-Medium.ttf
  String get interMedium => 'assets/google_fonts/Inter-Medium.ttf';

  /// File path: assets/google_fonts/Inter-Regular.ttf
  String get interRegular => 'assets/google_fonts/Inter-Regular.ttf';

  /// File path: assets/google_fonts/Inter-SemiBold.ttf
  String get interSemiBold => 'assets/google_fonts/Inter-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    greatVibesRegular,
    interBold,
    interMedium,
    interRegular,
    interSemiBold,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar1.svg
  String get avatar1 => 'assets/images/avatar1.svg';

  /// File path: assets/images/avatar2.svg
  String get avatar2 => 'assets/images/avatar2.svg';

  /// File path: assets/images/avatar3.png
  AssetGenImage get avatar3 => const AssetGenImage('assets/images/avatar3.png');

  /// File path: assets/images/avatar4.png
  AssetGenImage get avatar4 => const AssetGenImage('assets/images/avatar4.png');

  /// File path: assets/images/language_arabic_icon.svg
  String get languageArabicIcon => 'assets/images/language_arabic_icon.svg';

  /// File path: assets/images/language_english_icon.svg
  String get languageEnglishIcon => 'assets/images/language_english_icon.svg';

  /// File path: assets/images/listener_profile_under_review.svg
  String get listenerProfileUnderReview =>
      'assets/images/listener_profile_under_review.svg';

  /// File path: assets/images/listener_welcom_icon.svg
  String get listenerWelcomIcon => 'assets/images/listener_welcom_icon.svg';

  /// File path: assets/images/regestration_enable_notifications.png
  AssetGenImage get regestrationEnableNotifications => const AssetGenImage(
    'assets/images/regestration_enable_notifications.png',
  );

  /// File path: assets/images/sign_apple_icon.svg
  String get signAppleIcon => 'assets/images/sign_apple_icon.svg';

  /// File path: assets/images/sign_email_icon.svg
  String get signEmailIcon => 'assets/images/sign_email_icon.svg';

  /// File path: assets/images/sign_google_icon.svg
  String get signGoogleIcon => 'assets/images/sign_google_icon.svg';

  /// File path: assets/images/ventor_welcome_icon.svg
  String get ventorWelcomeIcon => 'assets/images/ventor_welcome_icon.svg';

  /// List of all assets
  List<dynamic> get values => [
    avatar1,
    avatar2,
    avatar3,
    avatar4,
    languageArabicIcon,
    languageEnglishIcon,
    listenerProfileUnderReview,
    listenerWelcomIcon,
    regestrationEnableNotifications,
    signAppleIcon,
    signEmailIcon,
    signGoogleIcon,
    ventorWelcomeIcon,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsGoogleFontsGen googleFonts = $AssetsGoogleFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
