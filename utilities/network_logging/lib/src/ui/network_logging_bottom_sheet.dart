import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:network_logging/network_logging.dart';
import 'package:network_logging/src/data/models/network_log_entry.dart';
import 'package:network_logging/src/ui/theme/network_logging_theme.dart';
import 'package:network_logging/src/ui/widgets/app_version_info.dart';
import 'package:network_logging/src/ui/widgets/sharing_sheet.dart';

/// Bottom sheet widget to display network request logs
/// Only available in development builds
class NetworkLoggingBottomSheet extends StatefulWidget {
  const NetworkLoggingBottomSheet({super.key});

  @visibleForTesting
  static bool debugForceCurlError = false;

  @override
  State<NetworkLoggingBottomSheet> createState() =>
      _NetworkLoggingBottomSheetState();
}

class _NetworkLoggingBottomSheetState extends State<NetworkLoggingBottomSheet> {
  List<NetworkLogEntry> _logs = [];
  bool _isLoading = false;
  String _searchQuery = '';
  int _selectedDayFilter = 0;

  @override
  void initState() {
    super.initState();
    _refreshLogs();
  }

  @override
  Widget build(BuildContext context) {
    final colors = NetworkLoggingTheme.colors(context);
    final textStyles = NetworkLoggingTheme.textStyles(context);
    final httpLogs = _logs
        .where(
          (log) =>
              log.eventType == NetworkEventType.http ||
              log.eventType == NetworkEventType.socket,
        )
        .where(
          (log) =>
              _searchQuery.isEmpty ||
              log.url.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .where((log) => _matchesSelectedDay(log.requestTimestamp))
        .toList();

    final totalEvents = _logs.length;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: Column(
        children: [
          const SizedBox(height: 16),
          const AppVersionInfo(),
          // Header with refresh and clear buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Network Events ($totalEvents)',
                    style: textStyles.textLg.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _isLoading ? null : _refreshLogs,
                  icon: _isLoading
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: colors.fgPrimary,
                          ),
                        )
                      : Icon(Icons.refresh, color: colors.fgPrimary),
                ),
                IconButton(
                  onPressed: _clearLogs,
                  icon: Icon(Icons.delete_outline, color: colors.fgPrimary),
                ),
                IconButton(
                  onPressed: () => _showShareSheet(httpLogs, context),
                  icon: Icon(Icons.share, color: colors.fgPrimary),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.trim();
                      });
                    },
                    style: textStyles.textSm.copyWith(
                      color: colors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search by URL',
                      hintStyle: textStyles.textSm.copyWith(
                        color: colors.textTertiary,
                      ),
                      prefixIcon: Icon(Icons.search, color: colors.fgSecondary),
                      isDense: true,
                      filled: true,
                      fillColor: colors.bgSecondary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: colors.textTertiary.withValues(alpha: 0.3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: colors.textTertiary.withValues(alpha: 0.3),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: colors.brand500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField<int>(
                    initialValue: _selectedDayFilter,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedDayFilter = value;
                      });
                    },
                    style: textStyles.textSm.copyWith(
                      color: colors.textPrimary,
                    ),
                    dropdownColor: colors.bgSecondary,
                    iconEnabledColor: colors.fgSecondary,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: colors.bgSecondary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: colors.textTertiary.withValues(alpha: 0.3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: colors.textTertiary.withValues(alpha: 0.3),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: colors.brand500),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem<int>(value: 0, child: Text('Today')),
                      DropdownMenuItem<int>(value: 1, child: Text('Yesterday')),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('2 days ago'),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text('3 days ago'),
                      ),
                      DropdownMenuItem<int>(
                        value: 4,
                        child: Text('4 days ago'),
                      ),
                      DropdownMenuItem<int>(
                        value: 5,
                        child: Text('5 days ago'),
                      ),
                      DropdownMenuItem<int>(
                        value: 6,
                        child: Text('6 days ago'),
                      ),
                      DropdownMenuItem<int>(
                        value: 7,
                        child: Text('7 days ago'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildLogsList(
              httpLogs,
              colors,
              textStyles,
              _searchQuery.isEmpty
                  ? 'No HTTP requests logged yet'
                  : 'No requests match your filters',
            ),
          ),
        ],
      ),
    );
  }

  bool _matchesSelectedDay(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDate = today.subtract(Duration(days: _selectedDayFilter));
    final requestDate = DateTime(
      timestamp.toLocal().year,
      timestamp.toLocal().month,
      timestamp.toLocal().day,
    );

    return requestDate == targetDate;
  }

  Widget _buildLogsList(
    List<NetworkLogEntry> logs,
    NetworkLoggingColors colors,
    NetworkLoggingTextStyles textStyles,
    String emptyMessage,
  ) {
    if (logs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.network_check, size: 48, color: colors.fgTertiary),
            const SizedBox(height: 16),
            Text(
              emptyMessage,
              style: textStyles.textMd.copyWith(color: colors.textSecondary),
            ),
            const SizedBox(height: 8),
            Text(
              'Make network requests to see them here',
              style: textStyles.textSm.copyWith(color: colors.textTertiary),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: logs.length,
      itemBuilder: (builderContext, index) {
        final log = logs[index];
        return _buildLogItem(log, colors, textStyles);
      },
    );
  }

  Widget _buildLogItem(
    NetworkLogEntry log,
    NetworkLoggingColors colors,
    NetworkLoggingTextStyles textStyles,
  ) {
    final uri = Uri.parse(log.url);
    final path = uri.path.isEmpty ? '/' : uri.path;
    final statusColor = _getStatusColor(log.statusCode, colors);
    final isSocket = log.eventType == NetworkEventType.socket;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: colors.bgSecondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSocket
              ? colors.brand500
              : colors.textTertiary.withValues(alpha: 0.3),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(shape: BoxShape.circle, color: statusColor),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isSocket
                    ? colors.brand500
                    : _getMethodColor(log.method, colors),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                isSocket ? 'WS' : log.method,
                style: textStyles.textXs.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (isSocket) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: colors.bgTertiary,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  log.method,
                  style: textStyles.textXs.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                isSocket ? (log.socketEvent ?? 'Socket Event') : path,
                style: textStyles.textSm.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  log.statusCode?.toString() ?? 'Pending',
                  style: textStyles.textXs.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${log.duration ?? 0}ms',
                  style: textStyles.textXs.copyWith(color: colors.textTertiary),
                ),
                const Spacer(),
                Text(
                  _formatTime(log.requestTimestamp),
                  style: textStyles.textXs.copyWith(color: colors.textTertiary),
                ),
              ],
            ),
            if (log.errorMessage != null) ...[
              const SizedBox(height: 4),
              Text(
                log.errorMessage!,
                style: textStyles.textXs.copyWith(color: colors.error500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
        onTap: () => _showLogDetails(log),
      ),
    );
  }

  Color _getStatusColor(int? statusCode, NetworkLoggingColors colors) {
    if (statusCode == null) return colors.fgTertiary;
    if (statusCode >= 200 && statusCode < 300) return colors.success500;
    if (statusCode >= 400 && statusCode < 500) return colors.warning500;
    if (statusCode >= 500) return colors.error500;
    return colors.fgTertiary;
  }

  Color _getMethodColor(String method, NetworkLoggingColors colors) {
    switch (method.toUpperCase()) {
      case 'GET':
        return Colors.blue;
      case 'POST':
        return Colors.green;
      case 'PUT':
        return Colors.orange;
      case 'DELETE':
        return Colors.red;
      case 'PATCH':
        return Colors.purple;
      default:
        return colors.fgSecondary;
    }
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    }
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }

  void _showLogDetails(NetworkLogEntry log) {
    final colors = NetworkLoggingTheme.colors(context);
    final textStyles = NetworkLoggingTheme.textStyles(context);
    final isSocket = log.eventType == NetworkEventType.socket;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.bgPrimary,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.9,
          child: Scaffold(
            backgroundColor: colors.bgPrimary,
            appBar: AppBar(
              backgroundColor: colors.bgSecondary,
              title: Text(
                isSocket ? 'Socket Event Details' : 'Request Details',
                style: textStyles.textLg.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.close, color: colors.fgPrimary),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailSection('URL', log.url, colors, textStyles),
                  if (isSocket) ...[
                    _buildDetailSection(
                      'Event Type',
                      log.method,
                      colors,
                      textStyles,
                    ),
                    _buildDetailSection(
                      'Socket Event',
                      log.socketEvent ?? 'Unknown',
                      colors,
                      textStyles,
                    ),
                    if (log.socketTargets?.isNotEmpty == true)
                      _buildDetailSection(
                        'Targets',
                        log.socketTargets!.join(', '),
                        colors,
                        textStyles,
                      ),
                    if (log.socketArgs?.isNotEmpty == true)
                      _buildDetailSection(
                        'Arguments',
                        log.socketArgs!.toString(),
                        colors,
                        textStyles,
                      ),
                  ] else
                    _buildDetailSection(
                      'Method',
                      log.method,
                      colors,
                      textStyles,
                    ),
                  _buildDetailSection(
                    'Status',
                    '${log.statusCode ?? 'Pending'}',
                    colors,
                    textStyles,
                  ),
                  _buildDetailSection(
                    'Duration',
                    '${log.duration ?? 0}ms',
                    colors,
                    textStyles,
                  ),
                  _buildDetailSection(
                    'Request Time',
                    _formatDateTime(log.requestTimestamp),
                    colors,
                    textStyles,
                  ),
                  if (log.responseTimestamp != null)
                    _buildDetailSection(
                      'Response Time',
                      _formatDateTime(log.responseTimestamp!),
                      colors,
                      textStyles,
                    ),
                  if (log.errorMessage != null)
                    _buildDetailSection(
                      'Error',
                      log.errorMessage!,
                      colors,
                      textStyles,
                    ),
                  if (log.requestHeaders.isNotEmpty)
                    _buildDetailSection(
                      'Request Headers',
                      log.requestHeaders.toString(),
                      colors,
                      textStyles,
                    ),
                  if (log.responseHeaders != null &&
                      log.responseHeaders!.isNotEmpty)
                    _buildDetailSection(
                      'Response Headers',
                      log.responseHeaders?.toString() ?? '',
                      colors,
                      textStyles,
                    ),
                  if (log.requestBody != null)
                    _buildDetailSection(
                      'Request Body',
                      log.requestBody!,
                      colors,
                      textStyles,
                    ),
                  if (log.responseBody != null)
                    _buildDetailSection(
                      'Response Body',
                      log.responseBody!,
                      colors,
                      textStyles,
                    ),
                  _buildCurlSection(log, colors, textStyles),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection(
    String label,
    String value,
    NetworkLoggingColors colors,
    NetworkLoggingTextStyles textStyles,
  ) {
    final bool showCopyButton =
        label == 'Request Body' || label == 'Response Body';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: textStyles.textSm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              if (showCopyButton)
                Builder(
                  builder: (ctx) => IconButton(
                    onPressed: () => _copyToClipboard(ctx, value),
                    icon: Icon(Icons.copy, size: 18, color: colors.fgSecondary),
                    tooltip: 'Copy',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.bgTertiary,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: colors.textTertiary.withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: textStyles.textXs.fontSize,
                fontFamily: 'monospace',
                color: colors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurlSection(
    NetworkLogEntry log,
    NetworkLoggingColors colors,
    NetworkLoggingTextStyles textStyles,
  ) {
    final curlCommand = _generateCurlCommand(log);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'cURL Command',
                style: textStyles.textSm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              Builder(
                builder: (ctx) => IconButton(
                  onPressed: () => _copyToClipboard(ctx, curlCommand),
                  icon: Icon(Icons.copy, size: 18, color: colors.fgSecondary),
                  tooltip: 'Copy cURL',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.bgTertiary,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: colors.textTertiary.withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              curlCommand,
              style: TextStyle(
                fontSize: textStyles.textXs.fontSize,
                fontFamily: 'monospace',
                color: colors.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }

  String _generateCurlCommand(NetworkLogEntry log) {
    try {
      if (NetworkLoggingBottomSheet.debugForceCurlError) {
        throw Exception('forced curl error');
      }
      final List<String> components = ['curl -i'];

      // Add method if not GET
      if (log.method.toUpperCase() != 'GET') {
        components.add('-X ${log.method}');
      }

      // Add headers (excluding Cookie for security)
      log.requestHeaders.forEach((k, v) {
        if (k != 'Cookie') {
          components.add('-H "$k: $v"');
        }
      });

      // Add request body if present
      if (log.requestBody != null && log.requestBody!.isNotEmpty) {
        try {
          // Try to parse as JSON to validate and escape properly
          final parsedData = json.decode(log.requestBody!);
          final data = json.encode(parsedData).replaceAll('"', '\\"');
          components.add('-d "$data"');
        } catch (e) {
          // If not valid JSON, treat as raw string and escape quotes
          final data = log.requestBody!.replaceAll('"', '\\"');
          components.add('-d "$data"');
        }
      }

      // Add URL
      components.add('"${log.url}"');

      return components.join(' \\\n\t');
    } catch (e) {
      return 'Error generating cURL command: $e';
    }
  }

  void _copyToClipboard(BuildContext ctx, String content) {
    // Copy content as-is without any formatting to avoid FormatExceptions
    Clipboard.setData(ClipboardData(text: content));

    // Show snackbar notification
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(content: Text('Copied'), duration: Duration(seconds: 2)),
    );
  }

  Future<void> _refreshLogs() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final manager = GetIt.instance<NetworkLogManager>();
      final storage = manager.httpStorage();

      final logs = await storage?.getAll();

      if (mounted) {
        setState(() {
          _logs = logs?.reversed.toList() ?? []; // Show newest first
        });
      }
    } catch (e) {
      if (mounted) {
        LoggerManagerBase.logErrorMessage(
          message: 'Error refreshing logs: $e',
          error: e,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _clearLogs() async {
    try {
      final manager = GetIt.instance<NetworkLogManager>();
      final httpStorage = manager.httpStorage();

      await httpStorage?.clear();
      await _refreshLogs();
    } catch (e) {
      LoggerManagerBase.logErrorMessage(
        message: 'Error clearing logs: $e',
        error: e,
      );
    }
  }

  void _showShareSheet(
    List<NetworkLogEntry> httpLogs,
    BuildContext methodContext,
  ) {
    SharingSheet.shareNetworkLogs(methodContext, httpLogs);
  }
}

/// Static method to show the network logging bottom sheet
class NetworkLoggingSheet {
  const NetworkLoggingSheet();
  static bool _isShowing = false;

  @visibleForTesting
  static void Function(BuildContext context)? debugShowOverride;

  @visibleForTesting
  static void resetShowingForTesting() {
    _isShowing = false;
    debugShowOverride = null;
  }

  static void show(BuildContext context) {
    if (debugShowOverride != null) {
      debugShowOverride!(context);
      return;
    }

    // Don't show if already showing
    if (_isShowing) {
      return;
    }

    // Ensure we have MaterialLocalizations by checking and providing fallback
    try {
      _isShowing = true;
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: NetworkLoggingTheme.colors(context).bgPrimary,
        builder: (context) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Material(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.9,
              child: Scaffold(
                backgroundColor: NetworkLoggingTheme.colors(context).bgPrimary,
                appBar: AppBar(
                  backgroundColor: NetworkLoggingTheme.colors(
                    context,
                  ).bgSecondary,
                  title: Text(
                    'Network Logs',
                    style: NetworkLoggingTheme.textStyles(context).textLg
                        .copyWith(
                          fontWeight: FontWeight.w600,
                          color: NetworkLoggingTheme.colors(
                            context,
                          ).textPrimary,
                        ),
                  ),
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: NetworkLoggingTheme.colors(context).fgPrimary,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                body: const NetworkLoggingBottomSheet(),
              ),
            ),
          ),
        ),
      ).then((_) {
        // Reset flag when bottom sheet is dismissed
        _isShowing = false;
      });
    } catch (e) {
      // Fallback: Show a simple dialog if MaterialLocalizations is not available
      _isShowing = false;
      LoggerManagerBase.logErrorMessage(
        message: 'NetworkLoggingSheet: MaterialLocalizations not available: $e',
        error: e,
      );

      _showFallbackDialog(context);
    }
  }

  static void _showFallbackDialog(BuildContext context) {
    // Use a simple overlay instead of Material dialog
    LoggerManagerBase.logInfo(
      message:
          'NetworkLoggingSheet: Showing fallback - Network logging not available in this context',
    );

    // Try to show a basic overlay if possible, otherwise just log
    try {
      final overlay = Overlay.of(context, rootOverlay: true);
      final overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: 100,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Network logging is not available in this context.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      overlay.insert(overlayEntry);

      // Remove the overlay after 3 seconds
      Future.delayed(const Duration(seconds: 3), overlayEntry.remove);
    } catch (e) {
      // If even overlay fails, just log the message
      LoggerManagerBase.logErrorMessage(
        message: 'NetworkLoggingSheet: Could not show fallback UI: $e',
        error: e,
      );
    }
  }
}
