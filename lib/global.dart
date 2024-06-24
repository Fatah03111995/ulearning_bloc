import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_bloc/core/services/storage_pref.dart';
import 'package:ulearning_bloc/firebase_options.dart';

class Global {
  static late StoragePref storagePref;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

    storagePref = await StoragePref().init();
  }
}
