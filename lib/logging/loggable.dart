import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swifty_gimo/swifty_gimo.dart';

class Loggable extends InheritedWidget {
  Loggable({
    Key? key,
    required Widget child,
    required this.log,
  }) : super(key: key, child: child);
  final Log log;

  static Log? of(
    BuildContext context, {
    required bool listen,
  }) {
    final widget = listen
        ? context.dependOnInheritedWidgetOfExactType<Loggable>()!
        : context.getElementForInheritedWidgetOfExactType<Loggable>()!.widget
            as Loggable;

    return widget.log;
  }

  @override
  bool updateShouldNotify(covariant Loggable oldWidget) {
    return oldWidget.log != log;
  }
}
