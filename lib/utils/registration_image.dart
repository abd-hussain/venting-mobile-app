import 'dart:io';

import 'package:flutter/material.dart';

ImageProvider<Object>? registrationImageProvider(String? path) {
  if (path == null || path.trim().isEmpty) return null;

  final trimmed = path.trim();
  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return NetworkImage(trimmed);
  }

  return FileImage(File(trimmed));
}

bool registrationPathIsRemote(String? path) {
  if (path == null) return false;
  final trimmed = path.trim().toLowerCase();
  return trimmed.startsWith('http://') || trimmed.startsWith('https://');
}
