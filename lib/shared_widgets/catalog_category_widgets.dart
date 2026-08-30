import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_category_model.dart';

abstract final class CatalogCategoryTheme {
  static const rowFill = Color(0xFF1C1826);
  static const iconFill = Color(0xFF2A2140);
  static const muted = Color(0xFF9B93AB);
  static const accent = Color(0xFF8A3CFE);
  static const checkboxBorder = Color(0xFF6B5F82);
}

String catalogCategoryLabel(CatalogCategoryModel category, Locale locale) {
  if (locale.languageCode.toLowerCase().startsWith('ar')) {
    return category.name_ar;
  }
  return category.name_en;
}

class CatalogCategoriesShimmer extends StatelessWidget {
  const CatalogCategoriesShimmer({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2A2140),
      highlightColor: const Color(0xFF3A2F52),
      child: ListView.separated(
        padding: padding ?? const EdgeInsets.fromLTRB(24, 24, 24, 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (_, _) => Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class CatalogCategoryRow extends StatelessWidget {
  const CatalogCategoryRow({
    super.key,
    required this.label,
    required this.iconUrl,
    required this.iconEmoji,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String iconUrl;
  final String iconEmoji;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CatalogCategoryTheme.rowFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected
                  ? CatalogCategoryTheme.accent.withValues(alpha: 0.55)
                  : Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Row(
            children: [
              CatalogCategoryIcon(
                url: iconUrl,
                emoji: iconEmoji,
                selected: selected,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: selected ? Colors.white : CatalogCategoryTheme.muted,
                    fontSize: 15,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: selected
                        ? CatalogCategoryTheme.accent
                        : CatalogCategoryTheme.checkboxBorder,
                    width: 1.5,
                  ),
                ),
                child: selected
                    ? const Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: CatalogCategoryTheme.accent,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogCategoryIcon extends StatelessWidget {
  const CatalogCategoryIcon({
    super.key,
    required this.url,
    required this.emoji,
    required this.selected,
  });

  final String url;
  final String emoji;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final trimmedUrl = url.trim();
    final trimmedEmoji = emoji.trim();
    final hasUrl = trimmedUrl.isNotEmpty;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: CatalogCategoryTheme.iconFill,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: hasUrl
          ? CachedNetworkImage(
              imageUrl: trimmedUrl,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
              placeholder: (_, _) =>
                  _emojiOrFallback(trimmedEmoji, selected: selected),
              errorWidget: (_, _, _) =>
                  _emojiOrFallback(trimmedEmoji, selected: selected),
            )
          : _emojiOrFallback(trimmedEmoji, selected: selected),
    );
  }

  static Widget _emojiOrFallback(String emoji, {required bool selected}) {
    if (emoji.isNotEmpty) {
      return Text(emoji, style: const TextStyle(fontSize: 20));
    }
    return Icon(
      Icons.category_outlined,
      size: 22,
      color: selected
          ? CatalogCategoryTheme.accent
          : CatalogCategoryTheme.muted,
    );
  }
}
