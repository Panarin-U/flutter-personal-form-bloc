

import 'package:flutter/material.dart';
import 'package:personal_form/personal_form/screens/screens.dart';

class Routing {
  final RouteObserver<PageRoute<dynamic>> _routeObserver = RouteObserver<PageRoute>();
  static Routing _instance;

  factory Routing() {
    if (_instance == null) _instance = Routing._initial();
    return _instance;
  }
  Routing._initial();

  RouteObserver<PageRoute<dynamic>> get routeObserver {
    return _routeObserver;
  }

  PageRoute generatePageRoute(RouteSettings settings) {
    Map<String, dynamic> args = settings.arguments ?? { 'opaque': true };
    bool opaque = args['opaque'] ?? true;

    return MaterialPageRoute(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Screens.getScreenWithRoute(settings.name, params: args),
      ),
      settings: settings,
    );
  }
}