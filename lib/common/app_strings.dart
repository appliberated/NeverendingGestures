import 'package:neverendinggestures/widgets/gestures_area.dart';

class AppStrings {
  static const String appName = 'Neverending Gestures';

  static const String drawerTitle = appName;

  static const Map<GestureType, String> gestureDrawerTitles = const {
    GestureType.tap: 'Neverending Taps',
    GestureType.doubleTap: 'Neverending Double Taps',
    GestureType.longPress: 'Neverending Long Presses',
    GestureType.swipe: 'Neverending Swipes',
  };
}
