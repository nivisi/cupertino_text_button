part of '../cupertino_text_button.dart';

Color _getNormalColor(CupertinoTextButton widget, BuildContext context) {
  final widgetNormalColor = widget.normalColor;
  if (widgetNormalColor != null) {
    return widgetNormalColor;
  }

  final cupertinoTextButtonTheme = CupertinoTextButtonTheme.of(context);

  return cupertinoTextButtonTheme?.color ?? Colors.black;
}

Color _getPressedColor(CupertinoTextButton widget, BuildContext context) {
  final widgetPressedColor = widget.normalColor;
  if (widgetPressedColor != null) {
    return widgetPressedColor;
  }

  final cupertinoTextButtonTheme = CupertinoTextButtonTheme.of(context);
  final themePressedColor = cupertinoTextButtonTheme?.pressedColor;
  if (themePressedColor != null) {
    return themePressedColor;
  }

  return Theme.of(context).primaryColor;
}

Duration _getForwardDuration(CupertinoTextButton widget, BuildContext context) {
  if (widget.forwardDuration != null) {
    return widget.forwardDuration!;
  }

  final cupertinoTextButtonTheme = CupertinoTextButtonTheme.of(context);

  return cupertinoTextButtonTheme?.forwardDuration ??
      kCupertinoTextButtonDefaultForwardAnimationDuration;
}

Duration _getBackwardDuration(
    CupertinoTextButton widget, BuildContext context) {
  if (widget.backwardDuration != null) {
    return widget.backwardDuration!;
  }

  final cupertinoTextButtonTheme = CupertinoTextButtonTheme.of(context);

  return cupertinoTextButtonTheme?.backwardDuration ??
      kCupertinoTextButtonDefaultBackwardAnimationDuration;
}

Curve _getCurve(CupertinoTextButton widget, BuildContext context) {
  final widgetCurve = widget.curve;
  if (widgetCurve != null) {
    return widgetCurve;
  }

  final cupertinoTextButtonTheme = CupertinoTextButtonTheme.of(context);

  return cupertinoTextButtonTheme?.curve ??
      kCupertinoTextButtonDefaultAnimationCurve;
}
