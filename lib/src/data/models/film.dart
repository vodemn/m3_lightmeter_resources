import 'package:m3_lightmeter_resources/m3_lightmeter_resources.dart';

class Film {
  final String name;
  final int iso;
  final double Function(double value)? reciprocityFormula;

  const Film({
    required this.name,
    required this.iso,
    this.reciprocityFormula,
  });

  const Film.other()
      : name = '',
        iso = 0,
        reciprocityFormula = null;

  @override
  String toString() => name;

  ShutterSpeedValue reciprocityFailure(ShutterSpeedValue shutterSpeed) {
    if (shutterSpeed.isFraction || reciprocityFormula == null) {
      return shutterSpeed;
    } else {
      return ShutterSpeedValue(
        reciprocityFormula!.call(shutterSpeed.rawValue),
        shutterSpeed.isFraction,
        shutterSpeed.stopType,
      );
    }
  }

  static const List<Film> values = [Film.other()];
}
