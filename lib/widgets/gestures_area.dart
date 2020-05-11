import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neverendinggestures/widgets/counter_style.dart';

enum GestureType { tap, doubleTap }

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

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
//    debugPaintPointersEnabled = true;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,

      onTap: gestureType == GestureType.tap ? onGesture : null,
      onDoubleTap: gestureType == GestureType.doubleTap ? onGesture : null,
      child: Container(
        alignment: Alignment.center,
//        color: Colors.red,

//        color: Colors.red,
        child: Text(
          localizations.formatDecimal(counter),
          style: counterStyle.textStyle,
        ),
      ),
    );
  }
}
