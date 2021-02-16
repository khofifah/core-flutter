import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  //STRING
  Future<bool> setUserData(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('userData', data);
  }

  Future<String> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userData');
  }
}
