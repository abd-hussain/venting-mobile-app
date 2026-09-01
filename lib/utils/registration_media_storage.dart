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
    return _persistFile(
      sourcePath,
      prefix: prefix,
      fallbackExtension: '.jpg',
      emptyMessage: 'Image file is empty.',
      missingMessage: 'Image file no longer exists.',
    );
  }

  /// Copies a voice recording into the registration draft folder before upload.
  static Future<String> persistAudio(
    String sourcePath, {
    required String prefix,
  }) async {
    return _persistFile(
      sourcePath,
      prefix: prefix,
      fallbackExtension: '.m4a',
      emptyMessage: 'Voice recording is empty.',
      missingMessage: 'Voice recording no longer exists.',
    );
  }

  static Future<String> _persistFile(
    String sourcePath, {
    required String prefix,
    required String fallbackExtension,
    required String emptyMessage,
    required String missingMessage,
  }) async {
    final normalized = normalizePath(sourcePath);
    final source = File(normalized);
    if (!await source.exists()) {
      throw StateError(missingMessage);
    }
    if (await source.length() == 0) {
      throw StateError(emptyMessage);
    }

    final dir = await draftDirectory();
    final destPath =
        '${dir.path}/${prefix}_${_uuid.v4()}${_extension(normalized, fallback: fallbackExtension)}';
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
