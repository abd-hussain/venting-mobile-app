import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/custom_buttomsheet.dart';

/// Shows a dark sheet to edit the listener city.
///
/// Returns the saved city text, or `null` if cancelled.
Future<String?> showEditCityBottomSheet({
  required BuildContext context,
  required String initialCity,
}) {
  return CustomButtomsheet(
    context: context,
    backgroundColor: ListenerProfileTheme.cardFill,
    padding: EdgeInsets.zero,
  ).show<String>(widget: EditCityBottomSheet(initialCity: initialCity));
}

class EditCityBottomSheet extends StatefulWidget {
  const EditCityBottomSheet({super.key, required this.initialCity});

  final String initialCity;

  static const maxLength = 30;

  @override
  State<EditCityBottomSheet> createState() => _EditCityBottomSheetState();
}

class _EditCityBottomSheetState extends State<EditCityBottomSheet> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialCity);
    _focusNode = FocusNode();
    _controller.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  String get _trimmed => _controller.text.trim();

  bool get _canSave {
    if (_trimmed.isEmpty) return false;
    return _trimmed != widget.initialCity.trim();
  }

  void _onCancel() => Navigator.of(context).pop();

  void _onSave() {
    if (!_canSave) return;
    // TODO: Persist city via listener profile API / repository.
    Navigator.of(context).pop(_trimmed);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final count = _controller.text.characters.length;

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
            l10n.listener_profile_edit_city_title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.listener_profile_edit_city_subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            maxLength: EditCityBottomSheet.maxLength,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            textCapitalization: TextCapitalization.words,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: SplashColors.purpleMid,
            decoration: InputDecoration(
              hintText: l10n.listener_reg_enter_city,
              hintStyle: GoogleFonts.inter(
                color: ListenerProfileTheme.muted.withValues(alpha: 0.7),
                fontSize: 15,
              ),
              filled: true,
              fillColor: const Color(0xFF14101C),
              counterText: '',
              contentPadding: const EdgeInsets.all(14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: ListenerProfileTheme.cardBorder,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: SplashColors.purpleMid.withValues(alpha: 0.8),
                  width: 1.4,
                ),
              ),
            ),
            onSubmitted: (_) => _onSave(),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              '$count/${EditCityBottomSheet.maxLength}',
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.muted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _onCancel,
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
