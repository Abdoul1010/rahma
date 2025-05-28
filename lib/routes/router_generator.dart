import 'package:flutter/material.dart';
import 'package:rahma_group/main.dart';
import 'package:rahma_group/pages/about.dart';
import 'package:rahma_group/pages/contacts.dart';
import 'package:rahma_group/routes/routes.dart';

import '../pages/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case accueil:
        return MaterialPageRoute(builder: (_) => Home());
      case apropos:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case contacts:
        return MaterialPageRoute(builder: (_) => Contacts());
      default :
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}