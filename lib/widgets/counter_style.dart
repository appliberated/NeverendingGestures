import 'dart:math';

import 'package:flutter/material.dart';

import 'package:neverendinggestures/utils/utils.dart';

class CounterStyle {
  static const double _minFontSize = 10.0;
  static const double _maxFontSize = 96.0;

  final Random _random = Random();

  /// The text style
  TextStyle _textStyle = TextStyle();

  TextStyle get textStyle => _textStyle;

  void shuffle() {
    double fontSize = _random.doubleInRange(_minFontSize, _maxFontSize);

    _textStyle = TextStyle(fontSize: fontSize);
    print(_textStyle);
  }
}
