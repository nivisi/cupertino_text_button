part of '../cupertino_text_button.dart';

Color _getNormalColor(CupertinoTextButton widget, BuildContext context) {
  if (widget.normalColor != null) {
    return widget.normalColor!;
  }

  final cupertinoTextButtonTheme = CupertinoTextButtonTheme.of(context);

  return cupertinoTextButtonTheme?.color ?? Colors.black;
}

Color _getPressedColor(CupertinoTextButton widget, BuildContext context) {
  if (widget.pressedColor != null) {
    return widget.pressedColor!;
  }

  final cupertinoTextButtonTheme = CupertinoTextButtonTheme.of(context);

  if (cupertinoTextButtonTheme?.pressedColor != null) {
    return cupertinoTextButtonTheme!.pressedColor!;
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
  if (widget.curve != null) {
    return widget.curve!;
  }

  final cupertinoTextButtonTheme = CupertinoTextButtonTheme.of(context);

  return cupertinoTextButtonTheme?.curve ??
      kCupertinoTextButtonDefaultAnimationCurve;
}
