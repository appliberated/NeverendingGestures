import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:neverendinggestures/utils/utils.dart';
import 'package:neverendinggestures/utils/color_utils.dart';

class CounterStyle {
  Color backColor;

  static const double _minFontSize = 10.0;
  static const double _maxFontSize = 112.0;

  /// Available font features
  ///
  /// [List source](https://github.com/googlefonts/roboto/blob/master/scripts/subset_for_web.py)
  static const _fontFeatures = [
    'c2sc',
    'ccmp',
    'cpsp',
    'dlig',
    'dnom',
    'frac',
    'kern',
    'liga',
    'lnum',
    'locl',
    'numr',
    'onum',
    'pnum',
    'smcp',
    'ss01',
    'ss02',
    'ss03',
    'ss04',
    'ss05',
    'ss06',
    'ss07',
    'tnum'
  ];

  final Random _random = Random();

  static const _alignmentValues = [Alignment.topLeft, Alignment.topCenter, Alignment.topRight,
    Alignment.centerLeft, Alignment.center, Alignment.centerRight,
    Alignment.bottomLeft, Alignment.bottomCenter, Alignment.bottomRight];

  Alignment alignment = Alignment.center;

  /// The text style
  TextStyle _textStyle = TextStyle();

  TextStyle get textStyle => _textStyle;

  void shuffle() {
    backColor = _shuffledBackColor();

    alignment = _random.nextBool() ? Alignment.center : _random.fromList(_alignmentValues);

    _textStyle = TextStyle(
      fontSize: _random.doubleInRange(_minFontSize, _maxFontSize),
      fontWeight: _random.fromList(FontWeight.values),
      color: _shuffledTextColor(),
      fontFeatures: [FontFeature(_random.fromList(_fontFeatures))],
      letterSpacing: _random.doubleInRange(-2.0, 15.0),
    );
//    print(_textStyle);
  }

  Color _shuffledBackColor() {
    switch (_random.nextInt(3)) {
      case 0:
        return Colors.white;
      case 1:
        return Colors.black;
      default:
        return _random.fromList(Colors.primaries);
    }
  }

  Color _shuffledTextColor() =>
      [Colors.white, Colors.black].contains(backColor) && _random.nextBool()
          ? ColorX.randomPrimary(_random)
          : backColor.contrastOf();
}
