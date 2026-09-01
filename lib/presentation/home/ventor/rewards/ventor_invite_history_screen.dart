import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_widgets.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<void> openVentorInviteHistoryScreen({
  required BuildContext context,
  required List<VentorInviteHistoryItem> items,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(builder: (_) => VentorInviteHistoryScreen(items: items)),
  );
}

class VentorInviteHistoryScreen extends StatelessWidget {
  const VentorInviteHistoryScreen({super.key, required this.items});

  final List<VentorInviteHistoryItem> items;

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  String _statusLabel(VentingMobLocalizations l10n, VentorInviteStatus status) {
    return switch (status) {
      VentorInviteStatus.pending => l10n.ventor_invite_status_pending,
      VentorInviteStatus.joined => l10n.ventor_invite_status_joined,
      VentorInviteStatus.firstSession =>
        l10n.ventor_invite_status_first_session,
      VentorInviteStatus.bookedCall => l10n.ventor_invite_status_booked,
    };
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
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
            color: Colors.white,
          ),
          title: Text(
            l10n.ventor_invite_history_title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: items.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    l10n.ventor_invite_history_empty,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: VentorProfileTheme.muted,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
                itemCount: items.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                    decoration: BoxDecoration(
                      color: VentorProfileTheme.cardFill,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: VentorProfileTheme.cardBorder),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: SplashColors.purpleMid.withValues(
                            alpha: 0.25,
                          ),
                          child: Text(
                            item.name.isNotEmpty
                                ? item.name[0].toUpperCase()
                                : '?',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _statusLabel(l10n, item.status),
                                style: GoogleFonts.inter(
                                  color: VentorProfileTheme.muted,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (item.pointsEarned > 0)
                          Text(
                            l10n.ventor_rewards_pts(
                              formatVentorPoints(item.pointsEarned),
                            ),
                            style: GoogleFonts.inter(
                              color: SplashColors.purpleMid,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
