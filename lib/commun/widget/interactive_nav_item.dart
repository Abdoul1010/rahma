import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

import '../../utils/constants.dart';

class InteractiveNavItem extends MouseRegion {
  static final appContainer =
  html.window.document.querySelectorAll('flt-glass-pane')[0];

  InteractiveNavItem(
      {super.key, required Widget? child, required String text, required String? routeName, required bool selected})
      : super(
    onHover: (PointerHoverEvent evt) {
      appContainer.style.cursor = 'pointer';
    },
    onExit: (PointerExitEvent evt) {
      appContainer.style.cursor = 'default';
    },
    child: InteractiveText(
      text: text,
      routeName: routeName,
      selected: selected,
    ),
  );
}

class InteractiveText extends StatefulWidget {
  final String text;
  final String? routeName;
  final bool selected;

  const InteractiveText({super.key,
    required this.text,
    this.routeName,
    required this.selected,
  });

  @override
  InteractiveTextState createState() => InteractiveTextState();
}

class InteractiveTextState extends State<InteractiveText> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => _hovered(true),
      onExit: (_) => _hovered(false),
      child: Text(widget.text,
          style: _hovering
              ? kPageTitleStyle.copyWith(
              color: Colors.blue, decoration: TextDecoration.underline)
              : (widget.selected)
              ? kPageTitleStyle.copyWith(color: Colors.yellow)
              : kPageTitleStyle),
    );
  }

  _hovered(bool hovered) {
    setState(() {
      _hovering = hovered;
    });
  }
}