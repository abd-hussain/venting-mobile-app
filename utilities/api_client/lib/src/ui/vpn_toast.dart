import 'package:flutter/material.dart';

class VpnToast {
  static GlobalKey<ScaffoldMessengerState>? _scaffoldMessengerKey;

  /// Sets the global ScaffoldMessenger key to use for showing toast messages
  // ignore: use_setters_to_change_properties
  static void setScaffoldMessengerKey(GlobalKey<ScaffoldMessengerState> key) {
    _scaffoldMessengerKey = key;
  }

  /// Shows a toast message using the global ScaffoldMessenger
  static void show(String message) {
    final messengerKey = _scaffoldMessengerKey;
    if (messengerKey?.currentState != null) {
      messengerKey!.currentState!
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 2),
          ),
        );
    }
  }
}
