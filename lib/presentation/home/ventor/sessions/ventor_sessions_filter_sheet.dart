import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<VentorSessionFilters?> showVentorSessionsFilterSheet({
  required BuildContext context,
  required VentorSessionFilters initial,
}) {
  return showModalBottomSheet<VentorSessionFilters>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => _VentorSessionsFilterSheet(initial: initial),
  );
}

class _VentorSessionsFilterSheet extends StatefulWidget {
  const _VentorSessionsFilterSheet({required this.initial});

  final VentorSessionFilters initial;

  @override
  State<_VentorSessionsFilterSheet> createState() =>
      _VentorSessionsFilterSheetState();
}

class _VentorSessionsFilterSheetState
    extends State<_VentorSessionsFilterSheet> {
  static const _sheetFill = Color(0xFF1C1826);

  late RangeValues _price;
  late Set<String> _languages;
  late Set<VentorListenerGender> _genders;
  late double _minRating;
  late VentorFavoriteFilter _favoriteFilter;

  @override
  void initState() {
    super.initState();
    _price = RangeValues(
      widget.initial.minPricePerMinute,
      widget.initial.maxPricePerMinute,
    );
    _languages = {...widget.initial.languages};
    _genders = {
      for (final g in widget.initial.genders)
        if (VentorSessionFilters.filterGenders.contains(g)) g,
    };
    _minRating = widget.initial.minRating;
    _favoriteFilter = widget.initial.favoriteFilter;
  }

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  String _genderLabel(VentingMobLocalizations l10n, VentorListenerGender g) {
    return switch (g) {
      VentorListenerGender.female => l10n.ventor_sessions_gender_female,
      VentorListenerGender.male => l10n.ventor_sessions_gender_male,
      VentorListenerGender.preferNotToSay =>
        l10n.ventor_sessions_gender_prefer_not,
    };
  }

  String _favoriteLabel(
    VentingMobLocalizations l10n,
    VentorFavoriteFilter filter,
  ) {
    return switch (filter) {
      VentorFavoriteFilter.any => l10n.ventor_sessions_filter_favorites_any,
      VentorFavoriteFilter.favoritesOnly =>
        l10n.ventor_sessions_filter_favorites_only,
      VentorFavoriteFilter.notFavorites =>
        l10n.ventor_sessions_filter_favorites_not,
    };
  }

  void _reset() {
    setState(() {
      _price = const RangeValues(
        VentorSessionFilters.priceFloor,
        VentorSessionFilters.priceCeil,
      );
      _languages = {};
      _genders = {};
      _minRating = 0;
      _favoriteFilter = VentorFavoriteFilter.any;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final ratingLabel = _minRating <= 0
        ? l10n.ventor_sessions_filter_rating_any
        : l10n.ventor_sessions_filter_rating_min(_minRating.toStringAsFixed(1));

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomInset + 12),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.82,
        ),
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
        decoration: BoxDecoration(
          color: _sheetFill,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: VentorProfileTheme.cardBorder),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.ventor_sessions_filters_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _reset,
                  child: Text(
                    l10n.ventor_sessions_filters_reset,
                    style: GoogleFonts.inter(
                      color: SplashColors.purpleMid,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      l10n.ventor_sessions_filter_price,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.ventor_sessions_filter_price_range(
                        _money(_price.start),
                        _money(_price.end),
                      ),
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                      ),
                    ),
                    RangeSlider(
                      values: _price,
                      max: VentorSessionFilters.priceCeil,
                      divisions: 30,
                      activeColor: SplashColors.purpleMid,
                      inactiveColor: Colors.white.withValues(alpha: 0.12),
                      labels: RangeLabels(
                        _money(_price.start),
                        _money(_price.end),
                      ),
                      onChanged: (value) => setState(() => _price = value),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.ventor_sessions_filter_language,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final lang
                            in VentorSessionsCatalog.availableLanguages)
                          _ChoiceChip(
                            label: lang,
                            selected: _languages.contains(lang),
                            onTap: () {
                              setState(() {
                                if (_languages.contains(lang)) {
                                  _languages.remove(lang);
                                } else {
                                  _languages.add(lang);
                                }
                              });
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.ventor_sessions_filter_gender,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final gender in VentorSessionFilters.filterGenders)
                          _ChoiceChip(
                            label: _genderLabel(l10n, gender),
                            selected: _genders.contains(gender),
                            onTap: () {
                              setState(() {
                                if (_genders.contains(gender)) {
                                  _genders.remove(gender);
                                } else {
                                  _genders.add(gender);
                                }
                              });
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.ventor_sessions_filter_favorites,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final option in VentorFavoriteFilter.values)
                          _ChoiceChip(
                            label: _favoriteLabel(l10n, option),
                            selected: _favoriteFilter == option,
                            onTap: () =>
                                setState(() => _favoriteFilter = option),
                          ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.ventor_sessions_filter_rating,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          ratingLabel,
                          style: GoogleFonts.inter(
                            color: VentorProfileTheme.gold,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _MinRatingStars(
                      value: _minRating,
                      onChanged: (value) => setState(() => _minRating = value),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: VentorProfileTheme.gold,
                        inactiveTrackColor: Colors.white.withValues(
                          alpha: 0.12,
                        ),
                        thumbColor: VentorProfileTheme.gold,
                        overlayColor: VentorProfileTheme.gold.withValues(
                          alpha: 0.16,
                        ),
                        valueIndicatorColor: VentorProfileTheme.gold,
                        valueIndicatorTextStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      child: Slider(
                        value: _minRating,
                        max: VentorSessionFilters.ratingCeil,
                        divisions: 10,
                        label: _minRating <= 0
                            ? l10n.ventor_sessions_filter_rating_any
                            : _minRating.toStringAsFixed(1),
                        onChanged: (value) =>
                            setState(() => _minRating = value),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    VentorSessionFilters(
                      minPricePerMinute: _price.start,
                      maxPricePerMinute: _price.end,
                      languages: _languages,
                      genders: _genders,
                      minRating: _minRating,
                      favoriteFilter: _favoriteFilter,
                    ),
                  );
                },
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
                child: Text(l10n.ventor_sessions_filters_apply),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MinRatingStars extends StatelessWidget {
  const _MinRatingStars({required this.value, required this.onChanged});

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var star = 1; star <= 5; star++)
          IconButton(
            onPressed: () {
              // Tap same filled star again to clear minimum.
              if (value >= star && value < star + 0.5) {
                onChanged(0);
              } else {
                onChanged(star.toDouble());
              }
            },
            visualDensity: VisualDensity.compact,
            icon: Icon(
              value >= star ? Icons.star_rounded : Icons.star_border_rounded,
              color: value >= star
                  ? VentorProfileTheme.gold
                  : VentorProfileTheme.muted,
              size: 32,
            ),
          ),
      ],
    );
  }
}

class _ChoiceChip extends StatelessWidget {
  const _ChoiceChip({
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
      color: selected ? SplashColors.purpleMid : const Color(0xFF15101F),
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
