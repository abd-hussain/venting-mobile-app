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
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Step 7 — Record a short voice introduction (max 60s).
class ListenerRegistrationStep7VoiceIntro extends StatefulWidget {
  const ListenerRegistrationStep7VoiceIntro({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  State<ListenerRegistrationStep7VoiceIntro> createState() =>
      _ListenerRegistrationStep7VoiceIntroState();
}

class _ListenerRegistrationStep7VoiceIntroState
    extends State<ListenerRegistrationStep7VoiceIntro>
    with SingleTickerProviderStateMixin {
  static const _cardFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _maxSeconds = 60;

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

  bool get _hasRecording {
    final path = _recordingPath;
    if (path == null) return false;
    final file = File(path);
    return file.existsSync() && file.lengthSync() > 0;
  }

  bool get _canContinue => _hasRecording && !_isRecording && !_isBusy;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
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
    return '${dir.path}/listener_voice_intro_${DateTime.now().millisecondsSinceEpoch}.$ext';
  }

  Future<void> _deleteRecordingFile(String? path) async {
    if (path == null) return;
    try {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (_) {}
  }

  /// Tries multiple encoders — Android emulators often fail with AAC.
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

        // Give the native recorder a brief moment to settle.
        await Future<void>.delayed(const Duration(milliseconds: 150));
        if (await _recorder.isRecording()) {
          return path;
        }

        // start() returned but session isn't active — clean up and try next.
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

    debugPrint('Voice intro recording failed. Last error: $lastError');
    return null;
  }

  Future<bool> _ensureMicPermission() async {
    final l10n = VentingMobLocalizations.of(context);

    // Prefer the recorder's native permission flow (shows the iOS system
    // dialog when status is undetermined). permission_handler alone can
    // mis-report permanentlyDenied if its iOS macros are missing.
    try {
      final granted = await _recorder.hasPermission();
      if (granted) return true;
    } catch (error) {
      debugPrint('Voice intro hasPermission error: $error');
    }

    var status = await Permission.microphone.status;
    if (status.isGranted || status.isLimited) return true;

    // Request only when iOS/Android can still show the system prompt.
    if (status.isDenied) {
      status = await Permission.microphone.request();
      if (status.isGranted || status.isLimited) return true;
    }

    if (!mounted) return false;

    if (status.isPermanentlyDenied) {
      _showMessage(l10n.listener_reg_voice_mic_permission_settings);
      // Mic appears in Settings only after the system prompt was shown once.
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

      // Replace any previous take.
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
        if (next >= _maxSeconds) {
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
      debugPrint('Voice intro start error: $error\n$stack');
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

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final displaySeconds = _isRecording ? _seconds : _recordedSeconds;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Container(
        decoration: BoxDecoration(
          color: _cardFill,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.listener_reg_voice_title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.listener_reg_voice_subtitle,
                style: GoogleFonts.inter(
                  color: Colors.white.withValues(alpha: 0.65),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              _VoiceVisualizer(
                pulse: _pulseController,
                amplitude: _amplitude,
                isRecording: _isRecording,
              ),
              const SizedBox(height: 12),
              Text(
                '${_format(displaySeconds)} / ${_format(_maxSeconds)}',
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
                  color: _muted,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: SingleChildScrollView(
                  child: _RecordingTips(
                    title: l10n.listener_reg_voice_tips_title,
                    tips: [
                      l10n.listener_reg_voice_tip_1,
                      l10n.listener_reg_voice_tip_2,
                      l10n.listener_reg_voice_tip_3,
                      l10n.listener_reg_voice_tip_4,
                      l10n.listener_reg_voice_tip_5,
                      l10n.listener_reg_voice_tip_6,
                    ].where((tip) => tip.trim().isNotEmpty).toList(),
                    exampleTitle: l10n.listener_reg_voice_example_title,
                    exampleBody: l10n.listener_reg_voice_example_body,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 54,
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: _toggleRecord,
                        icon: Icon(
                          _isRecording
                              ? Icons.stop_rounded
                              : Icons.mic_none_rounded,
                          size: 22,
                        ),
                        label: Text(
                          _isRecording
                              ? l10n.listener_reg_voice_stop
                              : l10n.listener_reg_voice_record,
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: SplashColors.purpleMid,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _recordingPath == null || _isRecording
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
                              alpha: _recordingPath == null || _isRecording
                                  ? 0.12
                                  : 0.22,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 54,
                child: FilledButton(
                  onPressed: _canContinue ? widget.onContinue : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: SplashColors.purpleMid,
                    disabledBackgroundColor: SplashColors.purpleMid.withValues(
                      alpha: 0.35,
                    ),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: Text(l10n.listener_reg_continue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecordingTips extends StatelessWidget {
  const _RecordingTips({
    required this.title,
    required this.tips,
    required this.exampleTitle,
    required this.exampleBody,
  });

  final String title;
  final List<String> tips;
  final String exampleTitle;
  final String exampleBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: SplashColors.purpleMid.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.lightbulb_outline_rounded,
                size: 18,
                color: SplashColors.purpleMid,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: SplashColors.purpleMid,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (final tip in tips) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: SplashColors.purpleMid,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      tip,
                      style: GoogleFonts.inter(
                        color: Colors.white.withValues(alpha: 0.78),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 6),
          Text(
            exampleTitle,
            style: GoogleFonts.inter(
              color: SplashColors.purpleMid,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.22),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            child: Text(
              exampleBody,
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.82),
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
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

  final Animation<double> pulse;
  final double amplitude;
  final bool isRecording;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulse,
      builder: (context, _) {
        final pulseValue = 0.85 + (pulse.value * 0.15);
        final ampBoost = isRecording ? (0.15 + amplitude * 0.35) : 0.0;

        return SizedBox(
          width: 180,
          height: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              for (var i = 3; i >= 1; i--)
                Container(
                  width: (90.0 + i * 28) * (pulseValue + ampBoost * 0.4),
                  height: (90.0 + i * 28) * (pulseValue + ampBoost * 0.4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: SplashColors.purpleMid.withValues(
                        alpha: 0.08 + (i * 0.05),
                      ),
                      width: 1.2,
                    ),
                  ),
                ),
              CustomPaint(
                size: const Size(140, 48),
                painter: _WaveformPainter(
                  amplitude: isRecording ? math.max(0.2, amplitude) : 0.22,
                  color: SplashColors.purpleMid.withValues(
                    alpha: isRecording ? 0.55 : 0.28,
                  ),
                ),
              ),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF241833),
                  border: Border.all(
                    color: SplashColors.purpleMid.withValues(alpha: 0.35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: SplashColors.purpleGlow.withValues(alpha: 0.25),
                      blurRadius: 18,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.mic_rounded,
                  size: 34,
                  color: SplashColors.purpleMid,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WaveformPainter extends CustomPainter {
  _WaveformPainter({required this.amplitude, required this.color});

  final double amplitude;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    final midY = size.height / 2;
    const bars = 28;
    final step = size.width / (bars - 1);

    for (var i = 0; i < bars; i++) {
      final x = i * step;
      final wave =
          math.sin(i * 0.55) * 10 +
          math.sin(i * 1.3) * 6 * amplitude +
          (amplitude * 14);
      final y = midY + ((i.isEven ? -1 : 1) * wave.abs());
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter oldDelegate) {
    return oldDelegate.amplitude != amplitude || oldDelegate.color != color;
  }
}
