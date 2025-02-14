import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save user login status
  static Future<void> setLoggedIn(bool isLoggedIn) async {
    await _prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Check if user is logged in
  static bool isLoggedIn() {
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  // Clear login data (Logout)
  static Future<void> logOut() async {
    await _prefs.remove('isLoggedIn');
  }
}
