import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/custom_buttomsheet.dart';

class EditVoiceIntroResult {
  const EditVoiceIntroResult({
    required this.filePath,
    required this.durationSeconds,
  });

  final String filePath;
  final int durationSeconds;

  String get durationLabel {
    final m = (durationSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (durationSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}

/// Shows a dark sheet to re-record the listener voice introduction.
///
/// Returns [EditVoiceIntroResult] on save, or `null` if cancelled.
Future<EditVoiceIntroResult?> showEditVoiceIntroBottomSheet({
  required BuildContext context,
  String? initialFilePath,
  int initialDurationSeconds = 0,
}) {
  return CustomButtomsheet(
    context: context,
    backgroundColor: ListenerProfileTheme.cardFill,
    padding: EdgeInsets.zero,
  ).show<EditVoiceIntroResult>(
    widget: EditVoiceIntroBottomSheet(
      initialFilePath: initialFilePath,
      initialDurationSeconds: initialDurationSeconds,
    ),
  );
}

class EditVoiceIntroBottomSheet extends StatefulWidget {
  const EditVoiceIntroBottomSheet({
    super.key,
    this.initialFilePath,
    this.initialDurationSeconds = 0,
  });

  final String? initialFilePath;
  final int initialDurationSeconds;

  static const maxSeconds = 60;

  @override
  State<EditVoiceIntroBottomSheet> createState() =>
      _EditVoiceIntroBottomSheetState();
}

class _EditVoiceIntroBottomSheetState extends State<EditVoiceIntroBottomSheet>
    with SingleTickerProviderStateMixin {
  final _recorder = AudioRecorder();
  final _player = AudioPlayer();

  late final AnimationController _pulseController;

  StreamSubscription<Amplitude>? _amplitudeSub;
  StreamSubscription<void>? _playerCompleteSub;
  Timer? _timer;
  final _stopwatch = Stopwatch();

  var _isRecording = false;
  var _isPlaying = false;
  var _isBusy = false;
  var _seconds = 0;
  var _recordedSeconds = 0;
  String? _recordingPath;
  double _amplitude = 0;
  var _didChangeRecording = false;

  bool get _hasRecording {
    final path = _recordingPath;
    if (path == null) return false;
    final file = File(path);
    return file.existsSync() && file.lengthSync() > 0;
  }

  bool get _canSave =>
      _hasRecording && !_isRecording && !_isBusy && _didChangeRecording;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    final initialPath = widget.initialFilePath;
    if (initialPath != null &&
        File(initialPath).existsSync() &&
        File(initialPath).lengthSync() > 0) {
      _recordingPath = initialPath;
      _recordedSeconds = widget.initialDurationSeconds;
      _seconds = widget.initialDurationSeconds;
    }

    _playerCompleteSub = _player.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() => _isPlaying = false);
    });
    unawaited(_configurePlayer());
  }

  Future<void> _configurePlayer() async {
    await _player.setReleaseMode(ReleaseMode.stop);
    await _player.setVolume(1);
  }

  @override
  void dispose() {
    _timer?.cancel();
    unawaited(_amplitudeSub?.cancel());
    unawaited(_playerCompleteSub?.cancel());
    _pulseController.dispose();
    unawaited(_recorder.dispose());
    unawaited(_player.dispose());
    super.dispose();
  }

  String _format(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<String> _recordingPathFor(AudioEncoder encoder) async {
    final dir = await getTemporaryDirectory();
    final ext = switch (encoder) {
      AudioEncoder.wav => 'wav',
      AudioEncoder.amrNb || AudioEncoder.amrWb => 'amr',
      AudioEncoder.opus => 'ogg',
      _ => 'm4a',
    };
    return '${dir.path}/listener_profile_voice_${DateTime.now().millisecondsSinceEpoch}.$ext';
  }

  Future<void> _deleteRecordingFile(String? path) async {
    if (path == null) return;
    // Never delete the original/initial recording from this sheet.
    if (path == widget.initialFilePath) return;
    try {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (_) {}
  }

  Future<String?> _startRecorderSession() async {
    final candidates = <AudioEncoder>[
      AudioEncoder.aacLc,
      AudioEncoder.wav,
      AudioEncoder.amrNb,
      AudioEncoder.aacEld,
    ];

    Object? lastError;

    for (final encoder in candidates) {
      try {
        final supported = await _recorder.isEncoderSupported(encoder);
        if (!supported) continue;

        final path = await _recordingPathFor(encoder);
        await _recorder.start(
          RecordConfig(
            encoder: encoder,
            androidConfig: const AndroidRecordConfig(
              audioSource: AndroidAudioSource.mic,
            ),
          ),
          path: path,
        );

        await Future<void>.delayed(const Duration(milliseconds: 150));
        if (await _recorder.isRecording()) {
          return path;
        }

        try {
          await _recorder.stop();
        } catch (_) {}
        await _deleteRecordingFile(path);
      } catch (error) {
        lastError = error;
        try {
          if (await _recorder.isRecording()) {
            await _recorder.stop();
          }
        } catch (_) {}
      }
    }

    debugPrint('Profile voice recording failed. Last error: $lastError');
    return null;
  }

  Future<bool> _ensureMicPermission() async {
    final l10n = VentingMobLocalizations.of(context);

    try {
      final granted = await _recorder.hasPermission();
      if (granted) return true;
    } catch (error) {
      debugPrint('Profile voice hasPermission error: $error');
    }

    var status = await Permission.microphone.status;
    if (status.isGranted || status.isLimited) return true;

    if (status.isDenied) {
      status = await Permission.microphone.request();
      if (status.isGranted || status.isLimited) return true;
    }

    if (!mounted) return false;

    if (status.isPermanentlyDenied) {
      _showMessage(l10n.listener_reg_voice_mic_permission_settings);
      await openAppSettings();
      return false;
    }

    _showMessage(l10n.listener_reg_voice_mic_permission);
    return false;
  }

  bool _isMissingPlugin(Object error) =>
      error is MissingPluginException ||
      error.toString().contains('MissingPluginException');

  Future<void> _toggleRecord() async {
    if (_isBusy) return;
    if (_isRecording) {
      await _stopRecording();
      return;
    }
    await _startRecording();
  }

  Future<void> _startRecording() async {
    if (_isBusy) return;
    setState(() => _isBusy = true);

    try {
      if (_isPlaying) {
        await _player.stop();
        setState(() => _isPlaying = false);
      }

      final permitted = await _ensureMicPermission();
      if (!permitted || !mounted) return;

      final previousPath = _recordingPath;
      setState(() {
        _recordingPath = null;
        _recordedSeconds = 0;
        _seconds = 0;
        _amplitude = 0;
      });
      await _deleteRecordingFile(previousPath);

      try {
        if (await _recorder.isRecording()) {
          await _recorder.stop();
        }
      } on MissingPluginException {
        if (!mounted) return;
        _showMessage(
          VentingMobLocalizations.of(context).listener_reg_voice_plugin_restart,
        );
        return;
      }

      final path = await _startRecorderSession();
      if (path == null) {
        if (!mounted) return;
        _showMessage(
          VentingMobLocalizations.of(context).listener_reg_voice_record_failed,
        );
        return;
      }

      _timer?.cancel();
      await _amplitudeSub?.cancel();
      _stopwatch
        ..reset()
        ..start();

      if (!mounted) return;
      setState(() {
        _isRecording = true;
        _seconds = 0;
        _recordingPath = null;
        _recordedSeconds = 0;
        _amplitude = 0;
        _didChangeRecording = true;
      });

      _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
        if (!mounted || !_isRecording) {
          timer.cancel();
          return;
        }
        final next = _stopwatch.elapsed.inSeconds;
        if (next != _seconds) {
          setState(() => _seconds = next);
        }
        if (next >= EditVoiceIntroBottomSheet.maxSeconds) {
          unawaited(_stopRecording());
        }
      });

      _amplitudeSub = _recorder
          .onAmplitudeChanged(const Duration(milliseconds: 120))
          .listen((amp) {
            if (!mounted || !_isRecording) return;
            final normalized = ((amp.current + 60) / 60).clamp(0.0, 1.0);
            setState(() => _amplitude = normalized);
          });
    } catch (error, stack) {
      debugPrint('Profile voice start error: $error\n$stack');
      if (!mounted) return;
      setState(() => _isRecording = false);
      final l10n = VentingMobLocalizations.of(context);
      _showMessage(
        _isMissingPlugin(error)
            ? l10n.listener_reg_voice_plugin_restart
            : l10n.listener_reg_voice_record_failed,
      );
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;
    setState(() => _isBusy = true);

    try {
      _timer?.cancel();
      _stopwatch.stop();
      await _amplitudeSub?.cancel();
      _amplitudeSub = null;

      final path = await _recorder.stop();
      if (!mounted) return;

      final elapsedSeconds = _stopwatch.elapsed.inSeconds;
      final fileOk =
          path != null &&
          File(path).existsSync() &&
          File(path).lengthSync() > 0;

      setState(() {
        _isRecording = false;
        _amplitude = 0;
        _seconds = elapsedSeconds;
        _recordedSeconds = fileOk
            ? (elapsedSeconds == 0 ? 1 : elapsedSeconds)
            : 0;
        _recordingPath = fileOk ? path : null;
        _didChangeRecording = fileOk;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isRecording = false;
        _amplitude = 0;
        _recordingPath = null;
        _recordedSeconds = 0;
      });
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<void> _togglePlay() async {
    if (_isBusy || _isRecording) return;
    final path = _recordingPath;
    if (path == null || !File(path).existsSync()) return;

    setState(() => _isBusy = true);
    try {
      if (_isPlaying) {
        await _player.stop();
        if (!mounted) return;
        setState(() => _isPlaying = false);
        return;
      }

      await _player.stop();
      await _player.play(DeviceFileSource(path));
      if (!mounted) return;
      setState(() => _isPlaying = true);
    } catch (_) {
      if (!mounted) return;
      setState(() => _isPlaying = false);
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<void> _onCancel() async {
    if (_isRecording) await _stopRecording();
    if (_isPlaying) await _player.stop();
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> _onSave() async {
    if (!_canSave) return;
    if (_isPlaying) await _player.stop();

    final path = _recordingPath;
    if (path == null) return;

    // TODO: Upload / persist voice intro via listener profile API / repository.
    if (!mounted) return;
    Navigator.of(context).pop(
      EditVoiceIntroResult(filePath: path, durationSeconds: _recordedSeconds),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final displaySeconds = _isRecording ? _seconds : _recordedSeconds;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            l10n.listener_profile_edit_voice_title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.listener_profile_edit_voice_subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          _VoiceVisualizer(
            pulse: _pulseController,
            amplitude: _amplitude,
            isRecording: _isRecording,
          ),
          const SizedBox(height: 14),
          Text(
            '${_format(displaySeconds)} / ${_format(EditVoiceIntroBottomSheet.maxSeconds)}',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.listener_reg_voice_speak_hint,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 52,
            child: Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _isBusy ? null : _toggleRecord,
                    icon: Icon(
                      _isRecording
                          ? Icons.stop_rounded
                          : Icons.mic_none_rounded,
                      size: 22,
                    ),
                    label: Text(
                      _isRecording
                          ? l10n.listener_reg_voice_stop
                          : (_hasRecording
                                ? l10n.listener_profile_edit_voice_re_record
                                : l10n.listener_reg_voice_record),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      disabledBackgroundColor: SplashColors.purpleMid
                          .withValues(alpha: 0.35),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: !_hasRecording || _isRecording || _isBusy
                        ? null
                        : _togglePlay,
                    icon: Icon(
                      _isPlaying
                          ? Icons.stop_rounded
                          : Icons.play_arrow_rounded,
                      size: 22,
                    ),
                    label: Text(
                      _isPlaying
                          ? l10n.listener_reg_voice_stop
                          : l10n.listener_reg_voice_play,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white.withValues(
                        alpha: 0.35,
                      ),
                      side: BorderSide(
                        color: Colors.white.withValues(
                          alpha: !_hasRecording || _isRecording ? 0.12 : 0.22,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _isBusy ? null : _onCancel,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                    minimumSize: const Size.fromHeight(52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Text(l10n.common_cancel),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: _canSave ? _onSave : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: SplashColors.purpleMid,
                    disabledBackgroundColor: SplashColors.purpleMid.withValues(
                      alpha: 0.35,
                    ),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white.withValues(
                      alpha: 0.7,
                    ),
                    elevation: 0,
                    minimumSize: const Size.fromHeight(52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: Text(l10n.common_save),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VoiceVisualizer extends StatelessWidget {
  const _VoiceVisualizer({
    required this.pulse,
    required this.amplitude,
    required this.isRecording,
  });

  final AnimationController pulse;
  final double amplitude;
  final bool isRecording;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulse,
      builder: (context, _) {
        return SizedBox(
          height: 72,
          child: CustomPaint(
            painter: _WaveBarsPainter(
              progress: pulse.value,
              amplitude: amplitude,
              active: isRecording,
            ),
            child: const SizedBox.expand(),
          ),
        );
      },
    );
  }
}

class _WaveBarsPainter extends CustomPainter {
  const _WaveBarsPainter({
    required this.progress,
    required this.amplitude,
    required this.active,
  });

  final double progress;
  final double amplitude;
  final bool active;

  @override
  void paint(Canvas canvas, Size size) {
    const barCount = 28;
    final barWidth = size.width / (barCount * 1.75);
    final gap = barWidth * 0.75;
    final midY = size.height / 2;

    for (var i = 0; i < barCount; i++) {
      final wave = math.sin(
        (i / barCount) * math.pi * 2 + progress * math.pi * 2,
      );
      final base = 0.22 + ((wave + 1) / 2) * 0.35;
      final live = active ? (0.35 + amplitude * 0.65) : 0.45;
      final height = size.height * base * live;

      final x = i * (barWidth + gap);
      final paint = Paint()
        ..color = SplashColors.purpleMid.withValues(
          alpha: active ? 0.55 + amplitude * 0.4 : 0.28,
        );

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(x + barWidth / 2, midY),
            width: barWidth,
            height: height.clamp(8.0, size.height),
          ),
          Radius.circular(barWidth / 2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WaveBarsPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.amplitude != amplitude ||
      oldDelegate.active != active;
}
