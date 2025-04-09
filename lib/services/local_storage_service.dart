import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class LocalStorageService {
  SharedPreferences? prefs;
  RxSharedPreferences? rxPrefs;

  Future<SharedPreferences> getPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      rxPrefs = RxSharedPreferences(prefs!, null);
    }
    // prefs.clear();
    return prefs!;
  }
}
