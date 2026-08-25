import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// Persists registration media under app documents so paths survive until `#22`.
class RegistrationMediaStorage {
  RegistrationMediaStorage._();

  static const _uuid = Uuid();

  static Future<Directory> draftDirectory() async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory('${base.path}/registration_draft');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  static String normalizePath(String path) {
    final trimmed = path.trim();
    if (trimmed.startsWith('file://')) {
      return Uri.parse(trimmed).toFilePath();
    }
    return trimmed;
  }

  static String _extension(String path, {String fallback = '.jpg'}) {
    final dot = path.lastIndexOf('.');
    if (dot <= 0 || dot == path.length - 1) return fallback;
    return path.substring(dot).toLowerCase();
  }

  /// Copies a picked/captured image into the registration draft folder.
  static Future<String> persistImage(
    String sourcePath, {
    required String prefix,
  }) async {
    final normalized = normalizePath(sourcePath);
    final source = File(normalized);
    if (!await source.exists()) {
      throw StateError('Image file no longer exists.');
    }
    if (await source.length() == 0) {
      throw StateError('Image file is empty.');
    }

    final dir = await draftDirectory();
    final destPath =
        '${dir.path}/${prefix}_${_uuid.v4()}${_extension(normalized)}';
    await source.copy(destPath);
    return destPath;
  }

  /// Returns a stable path for a new voice intro recording.
  static Future<String> newVoiceIntroPath({String extension = '.m4a'}) async {
    final dir = await draftDirectory();
    final ext = extension.startsWith('.') ? extension : '.$extension';
    return '${dir.path}/voice_intro_${_uuid.v4()}$ext';
  }
}
