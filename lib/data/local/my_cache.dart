import 'package:auto_auction_app/constants/my_cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCache{
  late SharedPreferences _preferences;

  Future<SharedPreferences> init() async{
    return _preferences = await SharedPreferences.getInstance();
  }

  void putString({required MyCacheKeys key, required String value}) async{
    await _preferences.setString(key.name, value);
  }

  String getString({required MyCacheKeys key,}) {
    return _preferences.getString(key.name,) ?? '';
  }

  void putBoolean({required MyCacheKeys key, required bool value}) async{
    await _preferences.setBool(key.name, value);
  }

  bool getBoolean({required MyCacheKeys key,}) {
    return _preferences.getBool(key.name,) ?? false;
  }

  void putInt({required MyCacheKeys key, required int value}) async{
    await _preferences.setInt(key.name, value);
  }

  int getInt({required MyCacheKeys key,}) {
    return _preferences.getInt(key.name,) ?? 0;
  }

  void putDouble({required MyCacheKeys key, required double value}) async{
    await _preferences.setDouble(key.name, value);
  }

  double getDouble({required MyCacheKeys key,}) {
    return _preferences.getDouble(key.name,) ?? 0.0;
  }

  Future<void> removeFromShared({required MyCacheKeys key,}) async{
    await _preferences.remove(key.name);
  }

  Future<void> clearShared() async{
    await _preferences.clear();
  }

}