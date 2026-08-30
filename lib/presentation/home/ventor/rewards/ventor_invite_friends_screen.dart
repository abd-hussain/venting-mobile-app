import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_invites.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/bloc/ventor_invites/ventor_invites_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_invite_history_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_invites_mapper.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_widgets.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<void> openVentorInviteFriendsScreen({required BuildContext context}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(builder: (_) => const VentorInviteFriendsScreen()),
  );
}

class VentorInviteFriendsScreen extends StatefulWidget {
  const VentorInviteFriendsScreen({super.key});

  @override
  State<VentorInviteFriendsScreen> createState() =>
      _VentorInviteFriendsScreenState();
}

class _VentorInviteFriendsScreenState extends State<VentorInviteFriendsScreen> {
  late final VentorInvitesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = diContainer<VentorInvitesBloc>()
      ..add(const VentorInvitesEvent.started());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: const _VentorInviteFriendsView(),
    );
  }
}

class _VentorInviteFriendsView extends StatelessWidget {
  const _VentorInviteFriendsView();

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  int _pointsValue(int value, int fallback) => value > 0 ? value : fallback;

  String _shareMessage(
    VentingMobLocalizations l10n,
    VentorInvitesOverviewData overview,
  ) {
    return l10n.ventor_invite_share_message(
      overview.inviteCode,
      overview.inviteLink,
    );
  }

  Future<void> _copyCode(BuildContext context, String code) async {
    final l10n = VentingMobLocalizations.of(context);
    await Clipboard.setData(ClipboardData(text: code));
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.ventor_invite_copied)));
  }

  Future<void> _copyLink(
    BuildContext context, {
    required String link,
    required String success,
  }) async {
    await Clipboard.setData(ClipboardData(text: link));
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(success)));
  }

  Future<void> _launchShareUri(BuildContext context, Uri uri) async {
    final l10n = VentingMobLocalizations.of(context);
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (opened || !context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.ventor_invite_share_failed)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

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
        ),
        body: SafeArea(
          child: BlocBuilder<VentorInvitesBloc, VentorInvitesState>(
            builder: (context, state) {
              if (state.isLoadingOrInitial) {
                return const _VentorInviteFriendsShimmer();
              }

              if (state.isLoadFailure) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.errorMessage.isNotEmpty
                              ? state.errorMessage
                              : l10n.common_unknown_error,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: () => context
                              .read<VentorInvitesBloc>()
                              .add(const VentorInvitesEvent.retryLoad()),
                          child: Text(l10n.common_retry),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final overview = state.overview;
              if (!state.isReady || overview == null) {
                return const SizedBox.shrink();
              }

              final earnRules = overview.earnRules;
              final registerPoints = _pointsValue(
                earnRules.pointsPerFriendRegister,
                VentorRewardsCatalog.pointsPerFriendRegister,
              );
              final firstCallPoints = _pointsValue(
                earnRules.pointsPerInviteFirstSession,
                VentorRewardsCatalog.pointsPerInviteFirstSession,
              );
              final shareText = _shareMessage(l10n, overview);
              final historyItems = [
                for (final item in overview.items)
                  ventorInviteHistoryItemFromData(item),
              ];

              return ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
                children: [
                  Text(
                    l10n.ventor_invite_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.ventor_invite_subtitle,
                    style: GoogleFonts.inter(
                      color: VentorProfileTheme.muted,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const _InviteIllustration(),
                  const SizedBox(height: 20),
                  Text(
                    l10n.ventor_invite_promo(registerPoints, firstCallPoints),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _CodeBox(
                    label: l10n.ventor_invite_your_code,
                    code: overview.inviteCode,
                    onCopy: () => _copyCode(context, overview.inviteCode),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    l10n.ventor_invite_share_title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: VentorProfileTheme.muted,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ShareCircle(
                        icon: Icons.chat_rounded,
                        color: const Color(0xFF25D366),
                        onTap: () => _launchShareUri(
                          context,
                          Uri.parse(
                            'https://wa.me/?text=${Uri.encodeComponent(shareText)}',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _ShareCircle(
                        icon: Icons.sms_rounded,
                        color: SplashColors.purpleMid,
                        onTap: () => _launchShareUri(
                          context,
                          Uri.parse(
                            'sms:?body=${Uri.encodeComponent(shareText)}',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _ShareCircle(
                        icon: Icons.camera_alt_rounded,
                        color: const Color(0xFFE1306C),
                        onTap: () => _copyLink(
                          context,
                          link: overview.inviteLink,
                          success: l10n.ventor_invite_instagram_hint,
                        ),
                      ),
                      const SizedBox(width: 12),
                      _ShareCircle(
                        icon: Icons.more_horiz_rounded,
                        color: const Color(0xFF3A3348),
                        onTap: () => _copyLink(
                          context,
                          link: overview.inviteLink,
                          success: l10n.ventor_invite_link_copied,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  _HowItWorksCard(
                    l10n: l10n,
                    registerPoints: registerPoints,
                    firstCallPoints: firstCallPoints,
                  ),
                  const SizedBox(height: 12),
                  _InvitesSummaryCard(
                    l10n: l10n,
                    totalInvited: overview.totalInvited,
                    invitePointsEarned: overview.invitePointsEarned,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 52,
                    child: FilledButton(
                      onPressed: () => openVentorInviteHistoryScreen(
                        context: context,
                        items: historyItems,
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text(l10n.ventor_invite_history_cta),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _VentorInviteFriendsShimmer extends StatelessWidget {
  const _VentorInviteFriendsShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.08),
      highlightColor: Colors.white.withValues(alpha: 0.16),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
        children: const [
          _InviteShimmerLine(width: 220, height: 28),
          SizedBox(height: 8),
          _InviteShimmerLine(width: double.infinity, height: 14),
          SizedBox(height: 24),
          _InviteShimmerCircle(size: 88),
          SizedBox(height: 20),
          _InviteShimmerLine(width: double.infinity, height: 14),
          SizedBox(height: 20),
          _InviteShimmerCard(height: 72),
          SizedBox(height: 22),
          _InviteShimmerLine(width: 140, height: 14),
          SizedBox(height: 12),
          _InviteShimmerCard(height: 48),
          SizedBox(height: 22),
          _InviteShimmerCard(height: 148),
          SizedBox(height: 12),
          _InviteShimmerCard(height: 88),
          SizedBox(height: 20),
          _InviteShimmerCard(height: 52),
        ],
      ),
    );
  }
}

class _InviteShimmerCard extends StatelessWidget {
  const _InviteShimmerCard({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class _InviteShimmerLine extends StatelessWidget {
  const _InviteShimmerLine({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class _InviteShimmerCircle extends StatelessWidget {
  const _InviteShimmerCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _InviteIllustration extends StatelessWidget {
  const _InviteIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: SplashColors.purpleMid.withValues(alpha: 0.18),
            ),
          ),
          const Icon(
            Icons.card_giftcard_rounded,
            color: SplashColors.purpleMid,
            size: 56,
          ),
          const Positioned(
            top: 12,
            left: 110,
            child: Icon(
              Icons.favorite_rounded,
              color: Color(0xFFFF6B9D),
              size: 18,
            ),
          ),
          const Positioned(
            top: 28,
            right: 108,
            child: Icon(
              Icons.favorite_rounded,
              color: SplashColors.purpleLight,
              size: 14,
            ),
          ),
          const Positioned(
            bottom: 18,
            left: 118,
            child: Icon(
              Icons.favorite_rounded,
              color: SplashColors.purpleMid,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeBox extends StatelessWidget {
  const _CodeBox({
    required this.label,
    required this.code,
    required this.onCopy,
  });

  final String label;
  final String code;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  code,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onCopy,
            icon: const Icon(Icons.copy_rounded, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _ShareCircle extends StatelessWidget {
  const _ShareCircle({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(icon, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}

class _HowItWorksCard extends StatelessWidget {
  const _HowItWorksCard({
    required this.l10n,
    required this.registerPoints,
    required this.firstCallPoints,
  });

  final VentingMobLocalizations l10n;
  final int registerPoints;
  final int firstCallPoints;

  @override
  Widget build(BuildContext context) {
    final steps = [
      l10n.ventor_invite_how_1,
      l10n.ventor_invite_how_2(registerPoints),
      l10n.ventor_invite_how_3(firstCallPoints),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.ventor_invite_how_title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < steps.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: SplashColors.purpleMid,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${i + 1}',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    steps[i],
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _InvitesSummaryCard extends StatelessWidget {
  const _InvitesSummaryCard({
    required this.l10n,
    required this.totalInvited,
    required this.invitePointsEarned,
  });

  final VentingMobLocalizations l10n;
  final int totalInvited;
  final int invitePointsEarned;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.ventor_invite_summary_title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.ventor_invite_total(totalInvited),
            style: GoogleFonts.inter(
              color: VentorProfileTheme.muted,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.ventor_invite_points_earned(
              formatVentorPoints(invitePointsEarned),
            ),
            style: GoogleFonts.inter(
              color: SplashColors.purpleMid,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
