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

  bool getDeviceFirstOpen() {
    return _pref.getBool(Constants.STORAGE_DEVICE_FIRST_OPEN) ?? false;
  }
}
