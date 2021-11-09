import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cupertino_text_button_theme.dart';
import 'util/cupertino_text_button_type.dart';

part 'util/helpers.dart';

class CupertinoTextButton extends StatefulWidget {
  /// Is automatically determined by using either the default constructor,
  /// or the [CupertinoTextButton.icon] one.
  final CupertinoTextButtonType type;

  /// The text to display.
  ///
  /// Is used in the default constructor that creates a button with text.
  final String? text;

  /// Style of the displayed text.
  ///
  /// Will be applied (if specified) for the [text].
  final TextStyle? textStyle;

  /// How the text should be aligned horizontally.
  ///
  /// Will be applied (if specified) for the [text].
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// Is used in the default constructor that creates a button with text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// How visual overflow should be handled.
  ///
  /// Is used in the default constructor that creates a button with text.
  ///
  /// If [softWrap] is true or null, the glyph causing overflow, and those that follow,
  /// will not be rendered. Otherwise, it will be shown with the given overflow option.
  final TextOverflow? textOverflow;

  /// Whether the text should break at soft line breaks.
  ///
  /// Is used in the default constructor that creates a button with text.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// The icon to display.
  ///
  /// Is used in the [CupertinoTextButton.icon] constructor that creates
  /// a button with icon.
  ///
  /// To use [CupertinoIcons],
  /// don't forget to add the [cupertino_icons] package to your pubspec.yaml.
  final IconData? iconData;

  /// The size of the icon in logical pixels.
  ///
  /// Is used in the [CupertinoTextButton.icon] constructor that creates
  /// a button with icon.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the current [IconTheme] size, if any. If there is no
  /// [IconTheme], or it does not specify an explicit size, then it defaults to
  /// 24.0.
  ///
  /// If this [Icon] is being placed inside an [IconButton], then use
  /// [IconButton.iconSize] instead, so that the [IconButton] can make the splash
  /// area the appropriate size as well. The [IconButton] uses an [IconTheme] to
  /// pass down the size to the [Icon].
  final double? iconSize;

  /// The text direction to use for rendering the icon.
  ///
  /// Is used in the [CupertinoTextButton.icon] constructor that creates
  /// a button with icon.
  ///
  /// If this is null, the ambient [Directionality] is used instead.
  ///
  /// Some icons follow the reading direction. For example, "back" buttons point
  /// left in left-to-right environments and right in right-to-left
  /// environments. Such icons have their [IconData.matchTextDirection] field
  /// set to true, and the [Icon] widget uses the [textDirection] to determine
  /// the orientation in which to draw the icon.
  ///
  /// This property has no effect if the [iconData]'s [IconData.matchTextDirection]
  /// field is false, but for consistency a text direction value must always be
  /// specified, either directly using this property or using [Directionality].
  final TextDirection? iconTextDirection;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  /// Foreground color of the button in normal state, e.g. not pressed.
  ///
  /// If not specified, the [normalColor] from the [CupertinoTextButtonTheme] is used.
  /// If it is not specified in [CupertinoTextButtonTheme],
  /// the [Colors.black] is used.
  final Color? normalColor;

  /// Foreground color of the button in pressed state.
  ///
  /// If not specified, the [pressedColor] from the [CupertinoTextButtonTheme] is used.
  /// If it is not specified in [CupertinoTextButtonTheme],
  /// the [primaryColor] of [Theme] is used.
  final Color? pressedColor;

  /// Duration of animation when taping / long pressing the button.
  ///
  /// If not specified, the [forwardDuration] from the [CupertinoTextButtonTheme] is used.
  /// If it is not specified in [CupertinoTextButtonTheme],
  /// [kCupertinoTextButtonDefaultForwardAnimationDuration] is used.
  final Duration? forwardDuration;

  /// Duration of animation when cancelling a tap.
  ///
  /// If not specified, the [backwardDuration] from the [CupertinoTextButtonTheme] is used.
  /// If it is not specified in [CupertinoTextButtonTheme],
  /// [kCupertinoTextButtonDefaultBackwardAnimationDuration] is used.
  final Duration? backwardDuration;

  /// Curve that is used for the animation.
  ///
  /// If not specified, the [curve] from the [CupertinoTextButtonTheme] is used.
  /// If it is not specified in [CupertinoTextButtonTheme],
  /// [kCupertinoTextButtonDefaultAnimationCurve] is used.
  final Curve? curve;

  const CupertinoTextButton({
    Key? key,
    required this.text,
    TextStyle? style,
    this.textAlign,
    this.textDirection,
    this.textOverflow,
    this.softWrap = true,
    this.onTap,
    this.onLongPress,
    this.normalColor,
    this.pressedColor,
    this.forwardDuration,
    this.backwardDuration,
    this.curve,
  })  : textStyle = style,
        iconData = null,
        iconSize = null,
        iconTextDirection = null,
        type = CupertinoTextButtonType.text,
        super(key: key);

  const CupertinoTextButton.icon({
    Key? key,
    required IconData icon,
    double? size,
    TextDirection? textDirection,
    this.onTap,
    this.onLongPress,
    this.normalColor,
    this.pressedColor,
    this.forwardDuration,
    this.backwardDuration,
    this.curve,
  })  : text = null,
        textStyle = null,
        textAlign = null,
        textDirection = null,
        textOverflow = null,
        softWrap = null,
        iconData = icon,
        iconSize = size,
        iconTextDirection = textDirection,
        type = CupertinoTextButtonType.icon,
        super(key: key);

  @override
  _CupertinoTextButtonState createState() => _CupertinoTextButtonState();
}

class _CupertinoTextButtonState extends State<CupertinoTextButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final ColorTween _colorTween;
  late final Animation<Color?> _animation;

  Curve _curve = kCupertinoTextButtonDefaultAnimationCurve;
  Duration _forwardDuration =
      kCupertinoTextButtonDefaultForwardAnimationDuration;
  Duration _backwardDuration =
      kCupertinoTextButtonDefaultBackwardAnimationDuration;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
    _colorTween = ColorTween();
    _animation = _colorTween.animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant CupertinoTextButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.normalColor != oldWidget.normalColor) {
      _colorTween.begin = _getNormalColor(widget, context);
    }

    if (widget.pressedColor != oldWidget.pressedColor) {
      _colorTween.end = _getPressedColor(widget, context);
    }

    if (widget.curve != oldWidget.curve) {
      _curve = _getCurve(widget, context);
    }

    if (widget.forwardDuration != oldWidget.forwardDuration) {
      _forwardDuration = _getForwardDuration(widget, context);
    }

    if (widget.backwardDuration != oldWidget.backwardDuration) {
      _backwardDuration = _getBackwardDuration(widget, context);
    }

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _colorTween.begin = _getNormalColor(widget, context);
    _colorTween.end = _getPressedColor(widget, context);
    _forwardDuration = _getForwardDuration(widget, context);
    _backwardDuration = _getBackwardDuration(widget, context);
    _curve = _getCurve(widget, context);
  }

  @override
  Widget build(BuildContext context) {
    final hasTapHandler = widget.onTap != null || widget.onLongPress != null;

    late final TransitionBuilder builder;

    switch (widget.type) {
      case CupertinoTextButtonType.text:
        builder = (_, __) {
          final style = widget.textStyle ?? const TextStyle();

          return Text(
            widget.text!,
            style: style.copyWith(color: _animation.value),
            textAlign: widget.textAlign,
            textDirection: widget.iconTextDirection,
            overflow: widget.textOverflow,
            softWrap: widget.softWrap,
          );
        };

        break;
      case CupertinoTextButtonType.icon:
        builder = (_, __) {
          return Icon(
            widget.iconData!,
            color: _animation.value,
            size: widget.iconSize,
            textDirection: widget.iconTextDirection,
          );
        };
        break;
      default:
        throw Exception('Unknown CupertinoTextButtonType: ${widget.type}');
    }

    return GestureDetector(
      onTapDown: hasTapHandler
          ? (details) {
              _animationController.animateTo(
                1.0,
                curve: _curve,
                duration: _forwardDuration,
              );
            }
          : null,
      onTapCancel: hasTapHandler
          ? () {
              _animationController.animateTo(
                0.0,
                curve: _curve,
                duration: _backwardDuration,
              );
            }
          : null,
      onTap: widget.onTap != null
          ? () {
              widget.onTap!.call();
              _animationController.animateTo(
                0.0,
                curve: _curve,
                duration: _backwardDuration,
              );
            }
          : null,
      onLongPress: widget.onLongPress != null
          ? () {
              widget.onLongPress!.call();
              _animationController.animateTo(
                0.0,
                curve: _curve,
                duration: _backwardDuration,
              );
            }
          : null,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: builder,
      ),
    );
  }
}
