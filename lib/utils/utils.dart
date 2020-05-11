import 'dart:math';

extension RandomX on Random {
  int intInRange(int min, int max) => min + nextInt(max - min);

  double doubleInRange(double min, double max) => nextDouble() * (max - min) + min;
}
