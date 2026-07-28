// To parse this JSON data, do
//
//     final mobileBffBaseError = mobileBffBaseErrorFromJson(jsonString);

import 'dart:convert';

MobileBffBaseError mobileBffBaseErrorFromJson(String str) =>
    MobileBffBaseError.fromJson(json.decode(str) as Map<String, dynamic>);

String mobileBffBaseErrorToJson(MobileBffBaseError data) =>
    json.encode(data.toJson());

class MobileBffBaseError {
  final int errorCode;
  final String description;

  const MobileBffBaseError({int? errorCode, String? description})
    : errorCode = errorCode ?? 0,
      description = description ?? 'unknown error';

  MobileBffBaseError copyWith({int? errorCode, String? description}) =>
      MobileBffBaseError(
        errorCode: errorCode ?? this.errorCode,
        description: description ?? this.description,
      );

  factory MobileBffBaseError.fromJson(Map<String, dynamic> json) {
    final errorData = json["error"] as Map<String, dynamic>?;
    return MobileBffBaseError(
      errorCode: errorData?["errorCode"] as int? ?? 0,
      description: errorData?["description"] as String? ?? 'unknown error',
    );
  }

  Map<String, dynamic> toJson() => {
    "error": {"errorCode": errorCode, "description": description},
  };
}
