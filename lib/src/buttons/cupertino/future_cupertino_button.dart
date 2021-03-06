import 'package:flutter/cupertino.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureCupertinoButton extends GenericFutureButtonWidget {
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color disabledColor;
  final double minSize;
  final double pressedOpacity;
  final BorderRadius borderRadius;
  final bool filled;

  FutureCupertinoButton({
    Key key,
    @required FutureCallback onPressed,
    @required Widget child,
    Curve animationCurve,
    Duration animationDuration,
    WidgetBuilder progressIndicatorBuilder,
    ProgressIndicatorLocation progressIndicatorLocation,
    this.padding,
    this.color,
    this.minSize,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.pressedOpacity = 0.4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  })  : filled = false,
        super(
          key: key,
          child: child,
          onPressed: onPressed,
          animationCurve: animationCurve,
          animationDuration: animationDuration,
          progressIndicatorBuilder: progressIndicatorBuilder ??
              defaultCupertinoProgressIndicatorBuilder,
          progressIndicatorLocation: progressIndicatorLocation,
        );

  FutureCupertinoButton.filled({
    Key key,
    @required FutureCallback onPressed,
    @required Widget child,
    Curve animationCurve,
    Duration animationDuration,
    WidgetBuilder progressIndicatorBuilder,
    ProgressIndicatorLocation progressIndicatorLocation,
    this.padding,
    this.minSize,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.pressedOpacity = 0.4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  })  : filled = true,
        color = null,
        super(
          key: key,
          child: child,
          onPressed: onPressed,
          animationCurve: animationCurve,
          animationDuration: animationDuration,
          progressIndicatorBuilder: progressIndicatorBuilder ??
              defaultCupertinoProgressIndicatorBuilder,
          progressIndicatorLocation: progressIndicatorLocation,
        );

  @override
  _FutureCupertinoButtonState createState() => _FutureCupertinoButtonState();
}

class _FutureCupertinoButtonState
    extends GenericFutureButtonState<FutureCupertinoButton> {
  @override
  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  }) {
    if (widget.filled) {
      return CupertinoButton.filled(
        child: child,
        onPressed: isEnabled ? onPressed : null,
        padding: widget.padding,
        minSize: widget.minSize,
        disabledColor: widget.disabledColor,
        pressedOpacity: widget.pressedOpacity,
        borderRadius: widget.borderRadius,
      );
    }

    return CupertinoButton(
      child: child,
      onPressed: isEnabled ? onPressed : null,
      padding: widget.padding,
      color: widget.color,
      minSize: widget.minSize,
      disabledColor: widget.disabledColor,
      pressedOpacity: widget.pressedOpacity,
      borderRadius: widget.borderRadius,
    );
  }
}
