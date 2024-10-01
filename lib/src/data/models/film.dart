import 'package:m3_lightmeter_resources/m3_lightmeter_resources.dart';

typedef ReciprocityFormula = double Function(double value);

class Film {
  final String name;
  final int iso;
  final ReciprocityFormula? reciprocityFormula;

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

class CustomFilm extends Film {
  final String id;

  const CustomFilm({
    required this.id,
    required super.name,
    required super.iso,
    super.reciprocityFormula,
  });

  CustomFilm copyWith({
    String? name,
    int? iso,
    ReciprocityFormula? reciprocityFormula,
  }) =>
      CustomFilm(
        id: id,
        name: name ?? this.name,
        iso: iso ?? this.iso,
        reciprocityFormula: reciprocityFormula ?? this.reciprocityFormula,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is CustomFilm &&
        other.id == id &&
        other.name == name &&
        other.iso == iso &&
        other.reciprocityFormula == reciprocityFormula;
  }

  @override
  int get hashCode => Object.hash(id, name, iso, runtimeType);
}
