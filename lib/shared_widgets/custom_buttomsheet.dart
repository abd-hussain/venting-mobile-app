import 'package:flutter/material.dart';

class CustomButtomsheet {
  final BuildContext context;
  final Color backgroundColor;
  final List<Color>? gradientColors;
  final EdgeInsetsGeometry padding;
  final bool isDismissible;
  final bool bottomSafeArea;

  const CustomButtomsheet({
    required this.context,
    this.backgroundColor = Colors.white,
    this.gradientColors,
    this.isDismissible = true,
    this.bottomSafeArea = true,
    this.padding = const EdgeInsets.only(
      left: 16,
      right: 16,
      top: 20,
      bottom: 20,
    ),
  });

  Future<T?> show<T>({required Widget widget, bool useSafeArea = true}) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      isScrollControlled: true,
      useRootNavigator: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: gradientColors != null
          ? Colors.transparent
          : backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        final scrollController = ScrollController();

        void scrollToEnd() {
          if (!scrollController.hasClients) return;

          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
          );
        }

        return StatefulBuilder(
          builder: (context, setState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              scrollToEnd();
            });

            final viewInsets = MediaQuery.of(context).viewInsets;

            Widget content = Padding(padding: padding, child: widget);

            if (gradientColors != null) {
              content = Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors!,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: content,
              );
            }

            return AnimatedPadding(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              padding: EdgeInsets.only(bottom: viewInsets.bottom),
              child: SafeArea(
                top: false,
                bottom: bottomSafeArea,
                child: NotificationListener<SizeChangedLayoutNotification>(
                  onNotification: (_) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      scrollToEnd();
                    });
                    return true;
                  },
                  child: SizeChangedLayoutNotifier(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: content,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
