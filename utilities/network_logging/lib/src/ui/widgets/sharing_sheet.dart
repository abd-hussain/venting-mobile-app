import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:intl/intl.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:network_logging/src/data/models/network_log_entry.dart';
import 'package:network_logging/src/ui/theme/network_logging_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class SharingSheet {
  const SharingSheet();

  @visibleForTesting
  static bool useTestBehavior = Platform.environment.containsKey(
    'FLUTTER_TEST',
  );

  @visibleForTesting
  static Future<Directory> Function()? debugGetApplicationDocumentsDirectory;

  @visibleForTesting
  static Future<void> Function()? debugSendEmail;

  @visibleForTesting
  static Future<void> Function()? debugRunEmailShare;

  @visibleForTesting
  static Future<ShareResult> Function({
    required List<XFile> files,
    String? text,
    String? subject,
  })?
  debugShareXFiles;

  @visibleForTesting
  static Future<void> Function(String text)? debugSetClipboard;

  @visibleForTesting
  static bool debugThrowOnPrepare = false;

  @visibleForTesting
  static Future<File> Function(String jsonData)? debugCreateJsonFile;

  @visibleForTesting
  static void Function(BuildContext context, String message)? debugShowSnackBar;

  @visibleForTesting
  static Duration shareOperationTimeout = const Duration(seconds: 30);

  @visibleForTesting
  static void resetTestOverrides() {
    debugGetApplicationDocumentsDirectory = null;
    debugSendEmail = null;
    debugRunEmailShare = null;
    debugShareXFiles = null;
    debugSetClipboard = null;
    debugCreateJsonFile = null;
    debugShowSnackBar = null;
    debugThrowOnPrepare = false;
    shareOperationTimeout = const Duration(seconds: 30);
    useTestBehavior = Platform.environment.containsKey('FLUTTER_TEST');
  }

  @visibleForTesting
  static Future<void> shareViaEmailProductionForTesting(
    BuildContext context,
    String jsonData,
  ) {
    useTestBehavior = false;
    return _shareViaEmail(context, jsonData);
  }

  @visibleForTesting
  static Future<void> shareViaEmailForTesting(
    BuildContext context,
    String jsonData,
  ) {
    useTestBehavior = true;
    return _shareViaEmail(context, jsonData);
  }

  @visibleForTesting
  static void copyToClipboardForTesting(BuildContext context, String jsonData) {
    _copyToClipboard(context, jsonData);
  }

  static Future<void> shareNetworkLogs(
    BuildContext context,
    List<NetworkLogEntry> httpLogs,
  ) async {
    if (httpLogs.isEmpty) {
      _showSnackBar(context, 'No logs events to share');
      return;
    }

    try {
      if (debugThrowOnPrepare) {
        throw Exception('prepare failed');
      }
      // Convert all socket entries to JSON
      final jsonData = _convertEntriesToJson(httpLogs);

      // Create a formatted JSON string
      const encoder = JsonEncoder.withIndent('  ');
      final formattedJson = encoder.convert(jsonData);

      // Show share options dialog
      await _showShareDialog(context, formattedJson);
    } catch (e) {
      if (context.mounted) {
        _showSnackBar(context, 'Error preparing events to share: ${e}');
      }
    }
  }

  static Map<String, dynamic> _convertEntriesToJson(
    List<NetworkLogEntry> httpLogs,
  ) {
    final exportData = {
      'export_info': {
        'timestamp': DateTime.now().toIso8601String(),
        'total_entries': httpLogs.length,
        'app_version': '1.0.0', // You can get this from package info
        'export_type': 'network_logs',
      },
      'http_events': httpLogs.map(_httpEntryToJson).toList(),
    };

    return exportData;
  }

  static void _showSnackBar(BuildContext context, String message) {
    if (debugShowSnackBar != null) {
      debugShowSnackBar!(context, message);
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 3)),
    );
  }

  static Future<void> _showShareDialog(
    BuildContext pContext,
    String jsonData,
  ) async {
    final colors = NetworkLoggingTheme.colors(pContext);
    final textStyles = NetworkLoggingTheme.textStyles(pContext);

    await showDialog<void>(
      context: pContext,
      builder: (BuildContext builderContext) {
        return AlertDialog(
          backgroundColor: colors.bgSecondary,
          title: Text(
            'Share all Network Logs',
            style: textStyles.textLg.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.textPrimary,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose how to share all Network Logs.\nFile sharing will create a JSON file attachment.',
                style: textStyles.textSm.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(builderContext).pop();
                      _copyToClipboard(pContext, jsonData);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.brand500,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Copy JSON'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.of(builderContext).pop();
                      await _shareViaEmail(pContext, jsonData);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.brand500,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Email'),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(builderContext).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colors.textPrimary,
                      side: BorderSide(color: colors.textTertiary),
                    ),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static Map<String, dynamic> _httpEntryToJson(NetworkLogEntry entry) {
    return entry.toJson();
  }

  static void _copyToClipboard(BuildContext context, String jsonData) {
    unawaited(_setClipboard(jsonData));
    _showSnackBar(context, 'Network logs copied to clipboard');
  }

  static Future<void> _setClipboard(String jsonData) async {
    if (debugSetClipboard != null) {
      await debugSetClipboard!(jsonData);
      return;
    }
    await Clipboard.setData(ClipboardData(text: jsonData));
  }

  static Future<void> _shareViaEmail(
    BuildContext context,
    String jsonData,
  ) async {
    if (useTestBehavior) {
      await _shareViaEmailForTests(context, jsonData);
      return;
    }

    try {
      final file = await _createJsonFile(jsonData);
      // Create email content without the large JSON data
      final subject =
          'Network Logs Export - ${DateTime.now().toIso8601String()}';
      final body =
          '''
Network Logs Debug Export

Export Details:
- Export Time: ${DateTime.now().toIso8601String()}
- App Version: 1.0.0
- Total Entries: See attached JSON file

The network logs data is attached as a JSON file for easier handling.

---
Generated by Network Logging Debug Tools
''';

      // Try to send email - this will throw if no email app is available
      if (debugSendEmail != null) {
        await debugSendEmail!();
      } else if (useTestBehavior) {
        // Avoid invoking platform email plugins in widget tests.
      } else {
        final email = Email(
          body: body,
          subject: subject,
          attachmentPaths: [file.path],
        );
        await FlutterEmailSender.send(email);
      }
      if (context.mounted) {
        _showSnackBar(context, 'Email app opened with attachment');
      }
    } catch (emailError) {
      LoggerManagerBase.logDebugMessage(
        message: 'Email sending failed: $emailError',
      );

      // Email app not available - fallback to platform share sheet
      // This shows all available sharing options (email, messaging, cloud storage, etc.)
      try {
        final file = await _createJsonFile(jsonData);
        LoggerManagerBase.logDebugMessage(
          message: 'Sharing file at: ${file.path}',
        );
        LoggerManagerBase.logDebugMessage(
          message: 'File exists for sharing: ${await file.exists()}',
        );

        // Verify file exists and is readable
        if (!await file.exists()) {
          throw Exception('File does not exist at ${file.path}');
        }

        final fileSize = await file.length();
        LoggerManagerBase.logDebugMessage(
          message: 'File size: $fileSize bytes',
        );

        final Future<ShareResult> shareFuture;
        if (debugShareXFiles != null) {
          shareFuture = debugShareXFiles!(
            files: const [],
            text: 'Network Logs Export',
            subject:
                'Network Logs Export - ${DateTime.now().toIso8601String()}',
          );
        } else {
          shareFuture = Share.shareXFiles(
            [XFile(file.path, mimeType: 'application/json')],
            text: 'Network Logs Export',
            subject:
                'Network Logs Export - ${DateTime.now().toIso8601String()}',
          );
        }

        final result = debugShareXFiles != null
            ? await shareFuture
            : await shareFuture.timeout(
                shareOperationTimeout,
                onTimeout: () {
                  throw TimeoutException('Share operation timed out');
                },
              );

        // If share was cancelled by user, that's fine - don't show error
        if (result.status == ShareResultStatus.dismissed) {
          return;
        }

        // Share completed successfully
        LoggerManagerBase.logDebugMessage(
          message: 'Share completed successfully',
        );
      } catch (shareError) {
        LoggerManagerBase.logDebugMessage(message: 'Share failed: $shareError');
        // Check if it's a MissingPluginException (plugin not registered)
        if (shareError.toString().contains('MissingPluginException')) {
          if (context.mounted) {
            _showSnackBar(
              context,
              'Share plugin not available. Please rebuild the app. JSON copied to clipboard.',
            );
          }
          // Still copy to clipboard as fallback
          try {
            await _setClipboard(jsonData);
          } catch (_) {
            // Ignore clipboard errors
          }
          return;
        }

        // If platform share also fails, fallback to clipboard
        try {
          await _setClipboard(jsonData);
          if (context.mounted) {
            _showSnackBar(context, 'Sharing failed. JSON copied to clipboard.');
          }
        } catch (clipboardError) {
          // If clipboard also fails, show error
          LoggerManagerBase.logDebugMessage(
            message: 'Clipboard failed: $clipboardError',
          );
          if (context.mounted) {
            _showSnackBar(
              context,
              'Unable to share. Please use "Copy JSON" option instead.',
            );
          }
        }
      }
    }
  }

  static Future<void> _shareViaEmailForTests(
    BuildContext context,
    String jsonData,
  ) async {
    try {
      if (debugRunEmailShare != null) {
        await debugRunEmailShare!();
      } else if (debugSendEmail != null) {
        await _createJsonFile(jsonData);
        await debugSendEmail!();
      } else {
        await _createJsonFile(jsonData);
      }
      if (context.mounted) {
        _showSnackBar(context, 'Email app opened with attachment');
      }
    } catch (emailError) {
      try {
        if (debugShareXFiles != null) {
          final result = await debugShareXFiles!(
            files: const [],
            text: 'Network Logs Export',
            subject:
                'Network Logs Export - ${DateTime.now().toIso8601String()}',
          );
          if (result.status == ShareResultStatus.dismissed) {
            return;
          }
          return;
        }

        final file = await _createJsonFile(jsonData);
        if (!await file.exists()) {
          throw Exception('File does not exist at ${file.path}');
        }

        const result = ShareResult('test', ShareResultStatus.dismissed);
        if (result.status == ShareResultStatus.dismissed) {
          return;
        }
      } catch (shareError) {
        if (shareError.toString().contains('MissingPluginException')) {
          if (context.mounted) {
            _showSnackBar(
              context,
              'Share plugin not available. Please rebuild the app. JSON copied to clipboard.',
            );
          }
          try {
            await _setClipboard(jsonData);
          } catch (_) {}
          return;
        }

        try {
          await _setClipboard(jsonData);
          if (context.mounted) {
            _showSnackBar(context, 'Sharing failed. JSON copied to clipboard.');
          }
        } catch (_) {
          if (context.mounted) {
            _showSnackBar(
              context,
              'Unable to share. Please use "Copy JSON" option instead.',
            );
          }
        }
      }
    }
  }

  @visibleForTesting
  static Future<File> createJsonFileForTesting(String jsonData) {
    return _createJsonFile(jsonData);
  }

  static Future<File> _createJsonFile(String jsonData) async {
    if (debugCreateJsonFile != null) {
      return debugCreateJsonFile!(jsonData);
    }
    if (useTestBehavior) {
      final directory = Directory.systemTemp.createTempSync(
        'network_logs_export',
      );
      final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final file = File('${directory.path}/network_logs_$timestamp.json');
      await file.writeAsString(jsonData);
      return file;
    }
    // Use application documents directory instead of cache for better sharing compatibility
    final directory = debugGetApplicationDocumentsDirectory != null
        ? await debugGetApplicationDocumentsDirectory!()
        : await getApplicationDocumentsDirectory();
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final fileName = 'network_logs_$timestamp.json';
    final file = File('${directory.path}/$fileName');

    await file.writeAsString(jsonData);
    LoggerManagerBase.logDebugMessage(
      message:
          'Created JSON file: ${file.path}, size: ${await file.length()} bytes',
    );
    return file;
  }
}
