import 'package:preferences/src/venting_preferences.dart';
import 'package:preferences/src/venting_preferences_impl.dart';

class MainPreferences {
  static Future<VentingPreferences> create() async {
    return VentingPreferencesImpl.create();
  }
}
