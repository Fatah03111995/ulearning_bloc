import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_bloc/core/constants/constants.dart';

class StoragePref {
  late final SharedPreferences _pref;

  Future<StoragePref> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> setBool({required String key, required bool value}) async {
    await _pref.setBool(key, value);
  }

  Future<void> setString({required String key, required String value}) async {
    await _pref.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(Constants.STORAGE_DEVICE_FIRST_OPEN) ?? false;
  }

  bool getIsLogIn() {
    return _pref.getString(Constants.STORAGE_USER_PROFILE_KEY) == null
        ? false
        : true;
  }
}
