import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http/feature/home/async_home.dart';
import 'package:riverpod_http/product/auth_controller/auth_controller.dart';
import 'package:riverpod_http/product/init/init_app.dart';
import 'feature/home/home_view.dart';
import 'feature/login/login_view.dart';
// Main changed

void main() async {
  await AppInit.initApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    Widget _getHome() {
      if (authState.authStatus == AuthStatus.authenticated) {
        return HomeView();
      } else {
        return LoginView();
      }
    }

    return MaterialApp(
      home: AsyncHome(),
    );
  }
}
