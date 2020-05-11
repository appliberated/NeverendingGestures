import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neverendinggestures/widgets/counter_style.dart';

enum GestureType { tap, doubleTap, longPress, swipe }

class GesturesArea extends StatelessWidget {
  final int counter;
  final GestureType gestureType;
  final void Function() onGesture;
  final CounterStyle counterStyle;

  GesturesArea(
      {Key key,
      @required this.counter,
      this.gestureType,
      this.onGesture,
      @required this.counterStyle})
      : super(key: key);

  void callOnGesture(GestureType detectedGestureType) {
    if (gestureType == detectedGestureType) onGesture();
  }

  void onPanEnd(DragEndDetails details) {
    onGesture();
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: gestureType == GestureType.tap ? onGesture : null,
      onDoubleTap: gestureType == GestureType.doubleTap ? onGesture : null,
      onLongPress: gestureType == GestureType.longPress ? onGesture : null,
      onPanEnd: gestureType == GestureType.swipe ? onPanEnd : null,
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: counterStyle.backColor,
        alignment: counterStyle.alignment,
        child: Text(
          localizations.formatDecimal(counter),
          style: counterStyle.textStyle,
        ),
      ),
    );
  }
}
