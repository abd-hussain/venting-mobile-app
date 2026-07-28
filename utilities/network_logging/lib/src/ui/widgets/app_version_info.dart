import 'package:flutter/material.dart';
import 'package:network_logging/src/ui/theme/network_logging_theme.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionInfo extends StatelessWidget {
  const AppVersionInfo({super.key});

  static final Future<PackageInfo> _packageInfoFuture =
      PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    final colors = NetworkLoggingTheme.colors(context);
    final textStyles = NetworkLoggingTheme.textStyles(context);

    return FutureBuilder<PackageInfo>(
      future: _packageInfoFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final packageInfo = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.bgSecondary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: colors.textTertiary.withValues(alpha: 0.35),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: _InfoColumn(
                        label: 'Version',
                        value: packageInfo.version,
                        valueColor: colors.brand500,
                        colors: colors,
                        textStyles: textStyles,
                      ),
                    ),
                    Container(
                      width: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      color: colors.textTertiary.withValues(alpha: 0.35),
                    ),
                    Expanded(
                      child: _InfoColumn(
                        label: 'Build',
                        value: packageInfo.buildNumber,
                        valueColor: colors.textPrimary,
                        colors: colors,
                        textStyles: textStyles,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _InfoColumn extends StatelessWidget {
  const _InfoColumn({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.colors,
    required this.textStyles,
  });

  final String label;
  final String value;
  final Color valueColor;
  final NetworkLoggingColors colors;
  final NetworkLoggingTextStyles textStyles;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: textStyles.textXs.copyWith(
            color: colors.textTertiary,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          textAlign: TextAlign.center,
          style: textStyles.textSm.copyWith(
            color: valueColor,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
