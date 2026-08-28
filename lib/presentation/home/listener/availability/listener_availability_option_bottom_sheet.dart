import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class PreferredSessionLengthSelection {
  const PreferredSessionLengthSelection({this.isAny = true, Set<int>? minutes})
    : minutes = minutes ?? const {};

  final bool isAny;
  final Set<int> minutes;

  static const minuteOptions = [30, 45, 60];
  static const maxMinuteSelections = 2;

  PreferredSessionLengthSelection copyWith({bool? isAny, Set<int>? minutes}) {
    return PreferredSessionLengthSelection(
      isAny: isAny ?? this.isAny,
      minutes: minutes ?? this.minutes,
    );
  }

  bool isMinuteSelected(int minutes) =>
      !isAny && this.minutes.contains(minutes);
}

Future<int?> showAvailabilityMinutesBottomSheet({
  required BuildContext context,
  required String title,
  required List<int> options,
  required int selected,
  required String Function(int) labelOf,
}) {
  return showModalBottomSheet<int>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options[index];
                    final isSelected = option == selected;
                    return ListTile(
                      title: Text(
                        labelOf(option),
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(
                              Icons.check_rounded,
                              color: SplashColors.purpleMid,
                            )
                          : null,
                      onTap: () => Navigator.of(context).pop(option),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<PreferredSessionLengthSelection?> showPreferredSessionLengthBottomSheet({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String anyLabel,
  required String Function(int minutes) minuteLabelOf,
  required String doneLabel,
  required PreferredSessionLengthSelection initial,
}) {
  return showModalBottomSheet<PreferredSessionLengthSelection>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      var selection = initial;

      PreferredSessionLengthSelection normalize(
        PreferredSessionLengthSelection value,
      ) {
        if (value.isAny || value.minutes.isNotEmpty) return value;
        return const PreferredSessionLengthSelection();
      }

      void selectAny(StateSetter setModalState) {
        setModalState(() {
          selection = const PreferredSessionLengthSelection();
        });
      }

      void toggleMinute(StateSetter setModalState, int minutes) {
        setModalState(() {
          if (selection.isAny) {
            selection = PreferredSessionLengthSelection(
              isAny: false,
              minutes: {minutes},
            );
            return;
          }

          final updated = Set<int>.from(selection.minutes);
          if (updated.contains(minutes)) {
            updated.remove(minutes);
            selection = updated.isEmpty
                ? const PreferredSessionLengthSelection()
                : PreferredSessionLengthSelection(
                    isAny: false,
                    minutes: updated,
                  );
            return;
          }

          if (updated.length >=
              PreferredSessionLengthSelection.maxMinuteSelections) {
            return;
          }

          updated.add(minutes);
          selection = PreferredSessionLengthSelection(
            isAny: false,
            minutes: updated,
          );
        });
      }

      return StatefulBuilder(
        builder: (context, setModalState) {
          return SafeArea(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
                    child: Text(
                      title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                    child: Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: Colors.white.withValues(alpha: 0.55),
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        _PreferredSessionLengthTile(
                          label: anyLabel,
                          selected: selection.isAny,
                          onTap: () => selectAny(setModalState),
                        ),
                        for (final minutes
                            in PreferredSessionLengthSelection.minuteOptions)
                          _PreferredSessionLengthTile(
                            label: minuteLabelOf(minutes),
                            selected: selection.isMinuteSelected(minutes),
                            onTap: () => toggleMinute(setModalState, minutes),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                    child: FilledButton(
                      onPressed: () =>
                          Navigator.of(context).pop(normalize(selection)),
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        doneLabel,
                        style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class _PreferredSessionLengthTile extends StatelessWidget {
  const _PreferredSessionLengthTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      trailing: selected
          ? const Icon(Icons.check_rounded, color: SplashColors.purpleMid)
          : null,
      onTap: onTap,
    );
  }
}
