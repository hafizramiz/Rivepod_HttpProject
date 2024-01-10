import 'package:flutter/material.dart';

import '../services/shared_pref_service.dart';

@immutable
class AppInit {
  AppInit._();
  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPref.instance.setup();
  }
}