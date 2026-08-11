import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerBankAccountInfo {
  const ListenerBankAccountInfo({
    required this.accountHolderName,
    required this.bankName,
    required this.ibanOrAccountNumber,
    this.swiftCode,
  });

  final String accountHolderName;
  final String bankName;
  final String ibanOrAccountNumber;
  final String? swiftCode;
}

/// Shows a sheet to add / edit bank account payout method.
Future<ListenerBankAccountInfo?> showPayoutMethodsBottomSheet({
  required BuildContext context,
  ListenerBankAccountInfo? initial,
}) {
  return showModalBottomSheet<ListenerBankAccountInfo>(
    context: context,
    isScrollControlled: true,
    backgroundColor: ListenerProfileTheme.cardFill,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => PayoutMethodsBottomSheet(initial: initial),
  );
}

class PayoutMethodsBottomSheet extends StatefulWidget {
  const PayoutMethodsBottomSheet({super.key, this.initial});

  final ListenerBankAccountInfo? initial;

  @override
  State<PayoutMethodsBottomSheet> createState() =>
      _PayoutMethodsBottomSheetState();
}

class _PayoutMethodsBottomSheetState extends State<PayoutMethodsBottomSheet> {
  late final TextEditingController _holderController;
  late final TextEditingController _bankController;
  late final TextEditingController _ibanController;
  late final TextEditingController _swiftController;
  var _submitted = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    _holderController = TextEditingController(
      text: initial?.accountHolderName ?? '',
    );
    _bankController = TextEditingController(text: initial?.bankName ?? '');
    _ibanController = TextEditingController(
      text: initial?.ibanOrAccountNumber ?? '',
    );
    _swiftController = TextEditingController(text: initial?.swiftCode ?? '');
    for (final c in [
      _holderController,
      _bankController,
      _ibanController,
      _swiftController,
    ]) {
      c.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _holderController.dispose();
    _bankController.dispose();
    _ibanController.dispose();
    _swiftController.dispose();
    super.dispose();
  }

  bool get _isValid =>
      _holderController.text.trim().isNotEmpty &&
      _bankController.text.trim().isNotEmpty &&
      _ibanController.text.trim().length >= 8;

  void _onCancel() => Navigator.of(context).pop();

  void _onSave() {
    setState(() => _submitted = true);
    if (!_isValid) return;
    // TODO: Persist bank account via payout methods API / repository.
    Navigator.of(context).pop(
      ListenerBankAccountInfo(
        accountHolderName: _holderController.text.trim(),
        bankName: _bankController.text.trim(),
        ibanOrAccountNumber: _ibanController.text.trim(),
        swiftCode: _swiftController.text.trim().isEmpty
            ? null
            : _swiftController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
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
                l10n.listener_profile_settings_payout_methods,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.listener_payout_bank_subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              _Field(
                label: l10n.listener_payout_bank_holder,
                hint: l10n.listener_payout_bank_holder_hint,
                controller: _holderController,
                textCapitalization: TextCapitalization.words,
                errorText: _submitted && _holderController.text.trim().isEmpty
                    ? l10n.listener_payout_bank_required
                    : null,
              ),
              const SizedBox(height: 14),
              _Field(
                label: l10n.listener_payout_bank_name,
                hint: l10n.listener_payout_bank_name_hint,
                controller: _bankController,
                textCapitalization: TextCapitalization.words,
                errorText: _submitted && _bankController.text.trim().isEmpty
                    ? l10n.listener_payout_bank_required
                    : null,
              ),
              const SizedBox(height: 14),
              _Field(
                label: l10n.listener_payout_bank_iban,
                hint: l10n.listener_payout_bank_iban_hint,
                controller: _ibanController,
                textCapitalization: TextCapitalization.characters,
                errorText: _submitted && _ibanController.text.trim().length < 8
                    ? l10n.listener_payout_bank_iban_invalid
                    : null,
              ),
              const SizedBox(height: 14),
              _Field(
                label: l10n.listener_payout_bank_swift,
                hint: l10n.listener_payout_bank_swift_hint,
                controller: _swiftController,
                textCapitalization: TextCapitalization.characters,
                optional: true,
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
                      onPressed: _onSave,
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        foregroundColor: Colors.white,
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
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.hint,
    required this.controller,
    this.textCapitalization = TextCapitalization.none,
    this.errorText,
    this.optional = false,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final String? errorText;
  final bool optional;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (optional) ...[
              const SizedBox(width: 6),
              Text(
                l10n.listener_payout_bank_optional,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          textCapitalization: textCapitalization,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: SplashColors.purpleMid,
          inputFormatters: optional
              ? null
              : [FilteringTextInputFormatter.deny(RegExp(r'\n'))],
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: ListenerProfileTheme.muted.withValues(alpha: 0.75),
              fontSize: 15,
            ),
            filled: true,
            fillColor: const Color(0xFF14101C),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasError
                    ? const Color(0xFFEF4444).withValues(alpha: 0.7)
                    : ListenerProfileTheme.cardBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasError
                    ? const Color(0xFFEF4444)
                    : SplashColors.purpleMid.withValues(alpha: 0.85),
                width: 1.4,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 6),
          Text(
            errorText!,
            style: GoogleFonts.inter(
              color: const Color(0xFFEF4444),
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
