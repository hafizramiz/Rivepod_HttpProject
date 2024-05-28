import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_http/feature/home/home_view.dart';
import 'package:riverpod_http/feature/login/login_view.dart';

class RouteManager {
  RouteManager._();

  static get routes => _routes;

  static final _routes = GoRouter(
      initialLocation: "/",
      routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: "home",
      builder: (context, state) => LoginView(),
    ),
  ]);
}
