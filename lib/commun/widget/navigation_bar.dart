import 'package:flutter/material.dart';
import 'package:rahma_group/routes/routes.dart';

import 'navigation_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          NavigationItem(
            selected: index == 0,
            title: 'Accueil',
            routeName: accueil,
            onHighlight: onHighlight,
          ),
          NavigationItem(
            selected: index == 1,
            title: 'A prorpos',
            routeName: apropos,
            onHighlight: onHighlight,
          ),
          NavigationItem(
            selected: index == 2,
            title: 'Contact',
            routeName: contacts,
            onHighlight: onHighlight,
          ),
        ],
      ),
    );
  }

  void onHighlight(String route) {
    switch (route) {
      case accueil:
        changeHighlight(0);
        break;
      case apropos:
        changeHighlight(1);
        break;
      case contacts:
        changeHighlight(2);
        break;
    }
  }

  void changeHighlight(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
}