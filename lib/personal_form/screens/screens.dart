


import 'package:flutter/material.dart';
import 'package:personal_form/personal_form/screens/list_personal_screen.dart';
import 'package:personal_form/personal_form/screens/personal_detail_screen.dart';
import 'package:personal_form/personal_form/screens/personal_form_screen.dart';

class Screens {
  static Map<String, StatefulWidget Function(Map<String, dynamic>)> routerTables = {
    'home': (_) => ListPersonalScreen(),
    'form': (_) => PersonalForm(),
    'detail': (params) => PersonalDetailScreen(params: params,)
  };

  static Widget getScreenWithRoute(String routName, { Map<String, dynamic> params }){

    if (routerTables.containsKey(routName)) {
      StatefulWidget Function(Map<String, dynamic>) screen = routerTables[routName];
      return screen(params);
    } else {
      return ListPersonalScreen();
    }
  }
}