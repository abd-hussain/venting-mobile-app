import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerEarningsChartPoint {
  const ListenerEarningsChartPoint({required this.label, required this.amount});

  final String label;
  final double amount;
}

class ListenerEarningsSummaryCard extends StatelessWidget {
  const ListenerEarningsSummaryCard({
    super.key,
    required this.totalLabel,
    required this.totalValue,
    required this.trendLabel,
    required this.sessionsLabel,
    required this.sessionsValue,
    required this.hoursLabel,
    required this.hoursValue,
    required this.rateLabel,
    required this.rateValue,
  });

  final String totalLabel;
  final String totalValue;
  final String trendLabel;
  final String sessionsLabel;
  final String sessionsValue;
  final String hoursLabel;
  final String hoursValue;
  final String rateLabel;
  final String rateValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 14, 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A1848), Color(0xFF1C1826)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      totalLabel,
                      style: GoogleFonts.inter(
                        color: SplashColors.purpleMid,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      totalValue,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      trendLabel,
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.gold,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const _WalletIllustration(),
            ],
          ),
          const SizedBox(height: 18),
          Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _MiniStat(label: sessionsLabel, value: sessionsValue),
              ),
              Container(
                width: 1,
                height: 34,
                color: Colors.white.withValues(alpha: 0.1),
              ),
              Expanded(
                child: _MiniStat(label: hoursLabel, value: hoursValue),
              ),
              Container(
                width: 1,
                height: 34,
                color: Colors.white.withValues(alpha: 0.1),
              ),
              Expanded(
                child: _MiniStat(label: rateLabel, value: rateValue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletIllustration extends StatelessWidget {
  const _WalletIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 78,
      height: 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 64,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: SplashColors.brandGradient,
              boxShadow: [
                BoxShadow(
                  color: SplashColors.purpleGlow.withValues(alpha: 0.35),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              width: 52,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.28),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            child: Container(
              width: 36,
              height: 22,
              decoration: BoxDecoration(
                color: const Color(0xFFE9D5FF),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const Icon(
            Icons.account_balance_wallet_rounded,
            color: Colors.white,
            size: 28,
          ),
        ],
      ),
    );
  }
}

class ListenerEarningsOverviewCard extends StatelessWidget {
  const ListenerEarningsOverviewCard({
    super.key,
    required this.title,
    required this.points,
    this.maxY = 150,
  });

  final String title;
  final List<ListenerEarningsChartPoint> points;
  final double maxY;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: CustomPaint(
              painter: _EarningsBarChartPainter(
                points: points,
                maxY: maxY,
                barColor: SplashColors.purpleMid,
                gridColor: Colors.white.withValues(alpha: 0.08),
                labelStyle: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: const SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }
}

class _EarningsBarChartPainter extends CustomPainter {
  _EarningsBarChartPainter({
    required this.points,
    required this.maxY,
    required this.barColor,
    required this.gridColor,
    required this.labelStyle,
  });

  final List<ListenerEarningsChartPoint> points;
  final double maxY;
  final Color barColor;
  final Color gridColor;
  final TextStyle labelStyle;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    const leftPad = 36.0;
    const bottomPad = 28.0;
    const topPad = 8.0;
    final chartW = size.width - leftPad;
    final chartH = size.height - bottomPad - topPad;

    final gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;

    for (final yValue in [0.0, maxY * 0.33, maxY * 0.66, maxY]) {
      final y = topPad + chartH * (1 - (yValue / maxY).clamp(0.0, 1.0));
      canvas.drawLine(Offset(leftPad, y), Offset(size.width, y), gridPaint);
      final label = TextPainter(
        text: TextSpan(text: '\$${yValue.round()}', style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: leftPad - 4);
      label.paint(canvas, Offset(0, y - label.height / 2));
    }

    final slot = chartW / points.length;
    final barWidth = (slot * 0.45).clamp(0.0, 28.0);

    for (var i = 0; i < points.length; i++) {
      final point = points[i];
      final ratio = (point.amount / maxY).clamp(0.0, 1.0);
      final barH = chartH * ratio;
      final cx = leftPad + slot * (i + 0.5);
      final rect = RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, topPad + chartH - barH / 2),
          width: barWidth,
          height: math.max(barH, 4),
        ),
        const Radius.circular(8),
      );
      canvas.drawRRect(
        rect,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [SplashColors.purpleLight, barColor],
          ).createShader(rect.outerRect),
      );

      final xLabel = TextPainter(
        text: TextSpan(text: point.label, style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: slot);
      xLabel.paint(
        canvas,
        Offset(cx - xLabel.width / 2, size.height - xLabel.height),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _EarningsBarChartPainter oldDelegate) {
    return oldDelegate.points != points ||
        oldDelegate.maxY != maxY ||
        oldDelegate.barColor != barColor;
  }
}

class ListenerRecentPayoutCard extends StatelessWidget {
  const ListenerRecentPayoutCard({
    super.key,
    required this.title,
    required this.dateLabel,
    required this.amountLabel,
    required this.statusLabel,
    required this.onTap,
  });

  final String title;
  final String dateLabel;
  final String amountLabel;
  final String statusLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ListenerProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: ListenerProfileTheme.cardBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      dateLabel,
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.muted,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    amountLabel,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ListenerProfileTheme.success.withValues(
                        alpha: 0.16,
                      ),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      statusLabel,
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.success,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListenerPayoutMethodsCard extends StatelessWidget {
  const ListenerPayoutMethodsCard({
    super.key,
    required this.title,
    required this.methodTitle,
    required this.methodSubtitle,
    required this.defaultLabel,
    required this.onTap,
  });

  final String title;
  final String methodTitle;
  final String methodSubtitle;
  final String defaultLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ListenerProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: ListenerProfileTheme.cardBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF003087).withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF009CDE).withValues(alpha: 0.45),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          color: Color(0xFF009CDE),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          methodTitle,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          methodSubtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            color: ListenerProfileTheme.muted,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    defaultLabel,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.success,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white.withValues(alpha: 0.35),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
