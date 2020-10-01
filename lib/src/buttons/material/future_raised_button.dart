import 'package:flutter/material.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureRaisedButton extends GenericFutureButtonWidget {
  final Widget child;

  FutureRaisedButton({
    Key key,
    @required FutureCallback onPressed,
    @required this.child,
    WidgetBuilder progressIndicatorBuilder,
    bool hideChild = false,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          progressIndicatorBuilder: progressIndicatorBuilder,
          hideChild: hideChild,
        );

  @override
  _FutureRaisedButtonState createState() => _FutureRaisedButtonState();
}

class _FutureRaisedButtonState
    extends GenericFutureButtonState<FutureRaisedButton> {
  @override
  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  }) {
    return RaisedButton(
      child: child,
      onPressed: isEnabled ? onPressed : null,
    );
  }
}
