import 'package:flutter/foundation.dart';
import 'package:m3_lightmeter_resources/m3_lightmeter_resources.dart';

typedef ReciprocityFailureBuilder = ShutterSpeedValue Function(ShutterSpeedValue shutterSpeed);

class Film {
  final String name;
  final int iso;

  const Film(this.name, this.iso);

  const Film.other()
      : name = '',
        iso = 0;

  @override
  String toString() => name;

  ShutterSpeedValue reciprocityFailure(ShutterSpeedValue shutterSpeed) {
    if (shutterSpeed.isFraction) {
      return shutterSpeed;
    } else {
      return ShutterSpeedValue(
        reciprocityFormula(shutterSpeed.rawValue),
        shutterSpeed.isFraction,
        shutterSpeed.stopType,
      );
    }
  }

  @protected
  double reciprocityFormula(double t) => t;

  static const List<Film> values = [Film.other()];
}
