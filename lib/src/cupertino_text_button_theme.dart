import 'package:flutter/material.dart';

const kCupertinoTextButtonDefaultForwardAnimationDuration =
    Duration(milliseconds: 20);
const kCupertinoTextButtonDefaultBackwardAnimationDuration =
    Duration(milliseconds: 200);
const kCupertinoTextButtonDefaultAnimationCurve = Curves.fastOutSlowIn;

class CupertinoTextButtonTheme extends InheritedWidget {
  final Color? color;
  final Color? pressedColor;
  final Duration forwardDuration;
  final Duration backwardDuration;
  final Curve curve;

  const CupertinoTextButtonTheme({
    Key? key,
    required Widget child,
    this.color,
    this.pressedColor,
    this.forwardDuration = kCupertinoTextButtonDefaultForwardAnimationDuration,
    this.backwardDuration =
        kCupertinoTextButtonDefaultBackwardAnimationDuration,
    this.curve = kCupertinoTextButtonDefaultAnimationCurve,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant CupertinoTextButtonTheme oldWidget) {
    return color != oldWidget.color ||
        pressedColor != oldWidget.pressedColor ||
        forwardDuration != oldWidget.forwardDuration ||
        backwardDuration != oldWidget.backwardDuration ||
        curve != oldWidget.curve;
  }

  static CupertinoTextButtonTheme? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CupertinoTextButtonTheme>();
  }
}
