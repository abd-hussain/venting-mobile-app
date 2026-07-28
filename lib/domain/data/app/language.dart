import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';

@freezed
abstract class LanguageModel with _$LanguageModel {
  factory LanguageModel({
    required String name,
    required String nameInOtherLang,
    required String languageCode,
    required String selectButtonTitle,
    required String svgIcon,
  }) = _LanguageModel;
}
