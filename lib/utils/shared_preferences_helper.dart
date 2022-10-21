
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{

  tokenRead() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final readValue = prefs.getString(key) ?? 0;
    print('read: $readValue');
    return readValue;
  }

  tokenSave(token) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = token;
    prefs.setString(key, value);
    print('saved $value');
  }


}