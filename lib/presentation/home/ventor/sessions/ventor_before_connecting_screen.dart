import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_widgets.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum _DiscountSource { promo, reward }

class _AppliedDiscount {
  const _AppliedDiscount({
    required this.source,
    required this.label,
    required this.amount,
    this.promoCode,
    this.offerId,
  });

  final _DiscountSource source;
  final String label;
  final double amount;
  final String? promoCode;
  final String? offerId;
}

enum VentorSessionCallMode { voice, video }

Future<void> openVentorBeforeConnectingScreen({
  required BuildContext context,
  required VentorFindListener listener,
  required int durationMinutes,
  required VentorSessionTimeChoice timeChoice,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => VentorBeforeConnectingScreen(
        listener: listener,
        durationMinutes: durationMinutes,
        timeChoice: timeChoice,
      ),
    ),
  );
}

class VentorBeforeConnectingScreen extends StatefulWidget {
  const VentorBeforeConnectingScreen({
    super.key,
    required this.listener,
    required this.durationMinutes,
    required this.timeChoice,
  });

  final VentorFindListener listener;
  final int durationMinutes;
  final VentorSessionTimeChoice timeChoice;

  @override
  State<VentorBeforeConnectingScreen> createState() =>
      _VentorBeforeConnectingScreenState();
}

class _VentorBeforeConnectingScreenState
    extends State<VentorBeforeConnectingScreen>
    with WidgetsBindingObserver {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  var _callMode = VentorSessionCallMode.voice;
  var _paying = false;
  var _micGranted = false;
  var _cameraGranted = false;
  var _voiceChangeEnabled = false;
  String? _speechLanguage;
  _AppliedDiscount? _discount;
  late final TextEditingController _promoController;

  static const _voiceChangeFee = 3.0;

  /// Demo promo codes for checkout.
  static const _promoCatalog = <String, ({int? percent, double? fixed})>{
    'SAVE10': (percent: 10, fixed: null),
    'VENT5': (percent: null, fixed: 5),
    'WELCOME15': (percent: 15, fixed: null),
  };

  double get _sessionPrice =>
      widget.listener.priceForMinutes(widget.durationMinutes);

  double get _voiceFee => _voiceChangeEnabled ? _voiceChangeFee : 0;

  double get _subtotal => _sessionPrice + _voiceFee;

  double get _discountAmount => _discount?.amount ?? 0;

  double get _total {
    final total = _subtotal - _discountAmount;
    return total < 0 ? 0 : total;
  }

  List<VentorRewardOffer> get _ownedRewards {
    final ids = <String>{};
    final offers = <VentorRewardOffer>[];
    for (final trade in VentorRewardsCatalog.mockTrades()) {
      if (!ids.add(trade.offerId)) continue;
      final offer = VentorRewardsCatalog.offerById(trade.offerId);
      if (offer == null) continue;
      if (offer.kind == VentorRewardOfferKind.priorityMatch) continue;
      offers.add(offer);
    }
    return offers;
  }

  bool get _needsCamera => _callMode == VentorSessionCallMode.video;

  bool get _permissionsReady =>
      _micGranted && (!_needsCamera || _cameraGranted);

  bool get _canPay => !_paying && _permissionsReady && _speechLanguage != null;

  @override
  void initState() {
    super.initState();
    _promoController = TextEditingController();
    WidgetsBinding.instance.addObserver(this);
    final languages = widget.listener.languages;
    if (languages.isNotEmpty) {
      _speechLanguage = languages.first;
    }
    _refreshPermissions();
  }

  @override
  void dispose() {
    _promoController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  double _discountForOffer(VentorRewardOffer offer) {
    return switch (offer.kind) {
      VentorRewardOfferKind.percentOff =>
        _sessionPrice * ((offer.percentOff ?? 0) / 100),
      VentorRewardOfferKind.freeMinutes =>
        widget.listener.ratePerMinute *
            (offer.freeMinutes ?? 0)
                .clamp(0, widget.durationMinutes)
                .toDouble(),
      VentorRewardOfferKind.priorityMatch => 0,
    };
  }

  void _clearDiscount() {
    setState(() => _discount = null);
  }

  void _applyPromoCode(VentingMobLocalizations l10n) {
    final code = _promoController.text.trim().toUpperCase();
    if (code.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.ventor_sessions_promo_empty)));
      return;
    }
    final promo = _promoCatalog[code];
    if (promo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.ventor_sessions_promo_invalid)),
      );
      return;
    }
    final amount = promo.percent != null
        ? _sessionPrice * (promo.percent! / 100)
        : (promo.fixed ?? 0).clamp(0, _sessionPrice).toDouble();
    final label = promo.percent != null
        ? l10n.ventor_sessions_promo_percent_label(promo.percent!)
        : l10n.ventor_sessions_promo_fixed_label(_money(promo.fixed ?? 0));
    setState(() {
      _discount = _AppliedDiscount(
        source: _DiscountSource.promo,
        label: label,
        amount: amount,
        promoCode: code,
      );
    });
    FocusScope.of(context).unfocus();
  }

  void _selectReward(VentorRewardOffer offer, VentingMobLocalizations l10n) {
    if (_discount?.offerId == offer.id) {
      _clearDiscount();
      return;
    }
    final amount = _discountForOffer(offer);
    if (amount <= 0) return;
    setState(() {
      _promoController.clear();
      _discount = _AppliedDiscount(
        source: _DiscountSource.reward,
        label: ventorRewardTitle(l10n, offer),
        amount: amount,
        offerId: offer.id,
      );
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshPermissions();
    }
  }

  Future<void> _refreshPermissions() async {
    final mic = await Permission.microphone.isGranted;
    final camera = await Permission.camera.isGranted;
    if (!mounted) return;
    setState(() {
      _micGranted = mic;
      _cameraGranted = camera;
    });
  }

  Future<bool> _requestPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isGranted) return true;
    if (status.isPermanentlyDenied) {
      if (!mounted) return false;
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.ventor_sessions_permission_settings)),
      );
      await openAppSettings();
      return false;
    }
    status = await permission.request();
    return status.isGranted;
  }

  Future<void> _requestMic() async {
    final granted = await _requestPermission(Permission.microphone);
    if (!mounted) return;
    setState(() => _micGranted = granted);
  }

  Future<void> _requestCamera() async {
    final granted = await _requestPermission(Permission.camera);
    if (!mounted) return;
    setState(() => _cameraGranted = granted);
  }

  Future<void> _onCallModeSelected(VentorSessionCallMode mode) async {
    setState(() => _callMode = mode);
    // Ask for permissions as soon as the call type is chosen.
    if (!_micGranted) {
      await _requestMic();
    }
    if (mode == VentorSessionCallMode.video && !_cameraGranted) {
      await _requestCamera();
    }
  }

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  String _countryFlag(String isoCode) {
    try {
      return countryFlagEmoji(IsoCode.values.byName(isoCode.toUpperCase()));
    } catch (_) {
      return '🏳️';
    }
  }

  String _timeSummary(VentingMobLocalizations l10n) {
    final choice = widget.timeChoice;
    switch (choice.mode) {
      case VentorSessionTimeMode.instant:
        return l10n.ventor_sessions_time_summary_instant;
      case VentorSessionTimeMode.nearest:
      case VentorSessionTimeMode.scheduled:
        final at = choice.scheduledAt;
        if (at == null) return l10n.ventor_sessions_time_summary_instant;
        final locale = Localizations.localeOf(context).toString();
        final label =
            '${DateFormat.MMMEd(locale).format(at)} · '
            '${DateFormat.jm(locale).format(at)}';
        if (choice.mode == VentorSessionTimeMode.nearest) {
          return l10n.ventor_sessions_time_summary_nearest(label);
        }
        return l10n.ventor_sessions_time_summary_scheduled(label);
    }
  }

  Future<void> _onPay() async {
    if (!_canPay) return;
    setState(() => _paying = true);
    // TODO: Open payment flow with call mode + speech language.
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() => _paying = false);
    final l10n = VentingMobLocalizations.of(context);
    final modeLabel = _callMode == VentorSessionCallMode.video
        ? l10n.ventor_sessions_call_video
        : l10n.ventor_sessions_call_voice;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.ventor_sessions_pay_mock(
            widget.listener.name,
            widget.durationMinutes,
            modeLabel,
            _money(_total),
          ),
        ),
      ),
    );
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final listener = widget.listener;
    final permissionNote = _needsCamera
        ? l10n.ventor_sessions_permission_note_video
        : l10n.ventor_sessions_permission_note_voice;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        appBar: AppBar(
          backgroundColor: SplashColors.backgroundBottom,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
            color: Colors.white,
          ),
          title: Text(
            l10n.ventor_sessions_confirm_title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  children: [
                    Text(
                      l10n.ventor_sessions_confirm_heading,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.ventor_sessions_confirm_subtitle,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 18),
                    _SectionCard(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(listener.avatarUrl),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        listener.name,
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    if (listener.isVerified) ...[
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.verified_rounded,
                                        size: 16,
                                        color: SplashColors.purpleMid,
                                      ),
                                    ],
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      size: 14,
                                      color: VentorProfileTheme.gold,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      listener.rating.toStringAsFixed(1),
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        listener.topics.join(' · '),
                                        style: GoogleFonts.inter(
                                          color: VentorProfileTheme.muted,
                                          fontSize: 12,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${_countryFlag(listener.countryIsoCode)} '
                                  '${listener.country}'
                                  '${listener.city.isEmpty ? '' : ', ${listener.city}'}',
                                  style: GoogleFonts.inter(
                                    color: VentorProfileTheme.muted,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  listener.languages.join(' · '),
                                  style: GoogleFonts.inter(
                                    color: VentorProfileTheme.muted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.ventor_sessions_confirm_summary_title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _SummaryRow(
                            label: l10n.ventor_sessions_confirm_duration,
                            value: l10n.ventor_sessions_duration_minutes(
                              widget.durationMinutes,
                            ),
                          ),
                          _SummaryRow(
                            label: l10n.ventor_sessions_confirm_time,
                            value: _timeSummary(l10n),
                          ),
                          _SummaryRow(
                            label: l10n.ventor_sessions_confirm_rate,
                            value: l10n.ventor_sessions_rate_per_min(
                              _money(listener.ratePerMinute),
                            ),
                          ),
                          _SummaryRow(
                            label: l10n.ventor_sessions_confirm_session_price,
                            value: _money(_sessionPrice),
                          ),
                          if (_voiceChangeEnabled)
                            _SummaryRow(
                              label:
                                  l10n.ventor_sessions_voice_change_fee_label,
                              value: _money(_voiceChangeFee),
                            ),
                          if (_discount != null)
                            _SummaryRow(
                              label: l10n.ventor_sessions_confirm_discount,
                              value: '-${_money(_discountAmount)}',
                            ),
                          _SummaryRow(
                            label: l10n.ventor_sessions_confirm_total,
                            value: _money(_total),
                            emphasize: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      l10n.ventor_sessions_confirm_call_type,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _CallModeTile(
                            selected: _callMode == VentorSessionCallMode.voice,
                            icon: Icons.call_rounded,
                            label: l10n.ventor_sessions_call_voice,
                            onTap: () => _onCallModeSelected(
                              VentorSessionCallMode.voice,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _CallModeTile(
                            selected: _callMode == VentorSessionCallMode.video,
                            icon: Icons.videocam_rounded,
                            label: l10n.ventor_sessions_call_video,
                            onTap: () => _onCallModeSelected(
                              VentorSessionCallMode.video,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.ventor_sessions_permission_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.info_outline_rounded,
                                color: SplashColors.purpleMid,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  permissionNote,
                                  style: GoogleFonts.inter(
                                    color: VentorProfileTheme.muted,
                                    fontSize: 12,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _PermissionTile(
                            icon: Icons.mic_rounded,
                            label: l10n.ventor_sessions_permission_mic,
                            granted: _micGranted,
                            actionLabel: _micGranted
                                ? l10n.ventor_sessions_permission_granted
                                : l10n.ventor_sessions_permission_allow,
                            onTap: _micGranted ? null : _requestMic,
                          ),
                          if (_needsCamera) ...[
                            const SizedBox(height: 10),
                            _PermissionTile(
                              icon: Icons.videocam_rounded,
                              label: l10n.ventor_sessions_permission_camera,
                              granted: _cameraGranted,
                              actionLabel: _cameraGranted
                                  ? l10n.ventor_sessions_permission_granted
                                  : l10n.ventor_sessions_permission_allow,
                              onTap: _cameraGranted ? null : _requestCamera,
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.ventor_sessions_speech_language_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.ventor_sessions_speech_language_subtitle(
                        listener.name,
                      ),
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final language in listener.languages)
                          _LanguageChip(
                            label: language,
                            selected: _speechLanguage == language,
                            onTap: () =>
                                setState(() => _speechLanguage = language),
                          ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.ventor_sessions_voice_change_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.ventor_sessions_voice_change_subtitle,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _SectionCard(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: SplashColors.purpleMid.withValues(
                                alpha: 0.16,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.record_voice_over_rounded,
                              color: SplashColors.purpleMid,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.ventor_sessions_voice_change_option,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  l10n.ventor_sessions_voice_change_price(
                                    _money(_voiceChangeFee),
                                  ),
                                  style: GoogleFonts.inter(
                                    color: VentorProfileTheme.muted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Switch.adaptive(
                            value: _voiceChangeEnabled,
                            activeThumbColor: Colors.white,
                            activeTrackColor: SplashColors.purpleMid,
                            onChanged: (value) =>
                                setState(() => _voiceChangeEnabled = value),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.ventor_sessions_discount_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.ventor_sessions_discount_subtitle,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.ventor_sessions_promo_code_label,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _promoController,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: InputDecoration(
                                    hintText:
                                        l10n.ventor_sessions_promo_code_hint,
                                    hintStyle: GoogleFonts.inter(
                                      color: VentorProfileTheme.muted,
                                      fontSize: 13,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withValues(
                                      alpha: 0.06,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.white.withValues(
                                          alpha: 0.1,
                                        ),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.white.withValues(
                                          alpha: 0.1,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: SplashColors.purpleMid,
                                      ),
                                    ),
                                  ),
                                  onSubmitted: (_) => _applyPromoCode(l10n),
                                ),
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                height: 48,
                                child: FilledButton(
                                  onPressed: () => _applyPromoCode(l10n),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: SplashColors.purpleMid,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    l10n.ventor_sessions_promo_apply,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (_ownedRewards.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            Text(
                              l10n.ventor_sessions_rewards_discount_label,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final offer in _ownedRewards)
                                  _RewardDiscountChip(
                                    label: ventorRewardTitle(l10n, offer),
                                    selected: _discount?.offerId == offer.id,
                                    onTap: () => _selectReward(offer, l10n),
                                  ),
                              ],
                            ),
                          ],
                          if (_discount != null) ...[
                            const SizedBox(height: 14),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: SplashColors.purpleMid.withValues(
                                  alpha: 0.14,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: SplashColors.purpleMid.withValues(
                                    alpha: 0.35,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.local_offer_rounded,
                                    color: SplashColors.purpleMid,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _discount!.label,
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          l10n.ventor_sessions_discount_applied(
                                            _money(_discountAmount),
                                          ),
                                          style: GoogleFonts.inter(
                                            color: VentorProfileTheme.muted,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: _clearDiscount,
                                    style: TextButton.styleFrom(
                                      foregroundColor: VentorProfileTheme.gold,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      l10n.ventor_sessions_discount_remove,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.ventor_sessions_confirm_tips_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _SectionCard(
                      child: Column(
                        children: [
                          _TipRow(text: l10n.ventor_sessions_confirm_tip_quiet),
                          _TipRow(
                            text: l10n.ventor_sessions_confirm_tip_honest,
                          ),
                          _TipRow(
                            text: l10n.ventor_sessions_confirm_tip_boundaries,
                          ),
                          _TipRow(
                            text: l10n.ventor_sessions_confirm_tip_leave,
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                decoration: BoxDecoration(
                  color: SplashColors.backgroundBottom,
                  border: Border(
                    top: BorderSide(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!_permissionsReady || _speechLanguage == null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          !_permissionsReady
                              ? l10n.ventor_sessions_permission_required_hint
                              : l10n.ventor_sessions_speech_language_required,
                          style: GoogleFonts.inter(
                            color: VentorProfileTheme.gold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.ventor_sessions_confirm_you_pay,
                            style: GoogleFonts.inter(
                              color: VentorProfileTheme.muted,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Text(
                          _money(_total),
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 54,
                      child: FilledButton(
                        onPressed: _canPay ? _onPay : null,
                        style: FilledButton.styleFrom(
                          backgroundColor: SplashColors.purpleMid,
                          disabledBackgroundColor: SplashColors.purpleMid
                              .withValues(alpha: 0.45),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          textStyle: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        child: _paying
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.4,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                l10n.ventor_sessions_pay_now(_money(_total)),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: child,
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: GoogleFonts.inter(
                color: emphasize ? SplashColors.purpleMid : Colors.white,
                fontSize: emphasize ? 15 : 13,
                fontWeight: emphasize ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CallModeTile extends StatelessWidget {
  const _CallModeTile({
    required this.selected,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final bool selected;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.18)
          : VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : VentorProfileTheme.cardBorder,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: selected
                    ? SplashColors.purpleMid
                    : VentorProfileTheme.muted,
                size: 26,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  const _PermissionTile({
    required this.icon,
    required this.label,
    required this.granted,
    required this.actionLabel,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool granted;
  final String actionLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
      decoration: BoxDecoration(
        color: const Color(0xFF15101F),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: granted
                ? VentorProfileTheme.success
                : VentorProfileTheme.muted,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              foregroundColor: granted
                  ? VentorProfileTheme.success
                  : SplashColors.purpleMid,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textStyle: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            child: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? SplashColors.purpleMid : VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : VentorProfileTheme.cardBorder,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: selected ? Colors.white : VentorProfileTheme.muted,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _RewardDiscountChip extends StatelessWidget {
  const _RewardDiscountChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.22)
          : Colors.white.withValues(alpha: 0.04),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : VentorProfileTheme.cardBorder,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.card_giftcard_rounded,
                size: 16,
                color: selected
                    ? SplashColors.purpleMid
                    : VentorProfileTheme.muted,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  const _TipRow({required this.text, this.isLast = false});

  final String text;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(
              Icons.lightbulb_outline_rounded,
              color: VentorProfileTheme.gold,
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
