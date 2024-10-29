import 'dart:math';

import 'package:m3_lightmeter_resources/src/utils/identifiable.dart';

import 'photography_values/shutter_speed_value.dart';

sealed class Film implements Identifiable {
  @override
  final String id;
  @override
  final String name;
  final int iso;

  const Film({
    required this.id,
    required this.name,
    required this.iso,
  });

  ShutterSpeedValue reciprocityFailure(ShutterSpeedValue shutterSpeed) {
    if (shutterSpeed.isFraction) {
      return shutterSpeed;
    } else {
      return ShutterSpeedValue(
        _reciprocityFormula.call(shutterSpeed.rawValue),
        shutterSpeed.isFraction,
        shutterSpeed.stopType,
      );
    }
  }

  double _reciprocityFormula(double t);

  static const List<Film> values = [FilmStub()];
}

class FilmStub extends Film {
  const FilmStub() : super(id: '', name: '', iso: 0);

  @override
  double _reciprocityFormula(double t) => t;
}

class FilmExponential extends Film {
  final double exponent;

  const FilmExponential({
    String? id,
    required super.name,
    required super.iso,
    required this.exponent,
  }) : super(id: id ?? name);

  @override
  double _reciprocityFormula(double t) => pow(t, exponent).toDouble();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FilmExponential &&
        other.id == id &&
        other.name == name &&
        other.iso == iso &&
        other.exponent == exponent;
  }

  @override
  int get hashCode => Object.hash(id, name, iso, exponent, runtimeType);

  FilmExponential copyWith({String? name, int? iso, double? exponent}) {
    return FilmExponential(
      id: id,
      name: name ?? this.name,
      iso: iso ?? this.iso,
      exponent: exponent ?? this.exponent,
    );
  }
}

class FilmPolynomian extends Film {
  final double a;
  final double b;
  final double c;

  const FilmPolynomian({
    String? id,
    required super.name,
    required super.iso,
    required this.a,
    required this.b,
    required this.c,
  }) : super(id: id ?? name);

  @override
  double _reciprocityFormula(double t) {
    double log10(double x) => log(x) / log(10);
    return t * (a * pow(log10(t), 2) + b * log10(t) + c);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FilmPolynomian &&
        other.id == id &&
        other.name == name &&
        other.iso == iso &&
        other.a == a &&
        other.b == b &&
        other.c == c;
  }

  @override
  int get hashCode => Object.hash(id, name, iso, a, b, c, runtimeType);

  FilmPolynomian copyWith({String? name, int? iso, double? a, double? b, double? c}) {
    return FilmPolynomian(
      id: id,
      name: name ?? this.name,
      iso: iso ?? this.iso,
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
    );
  }
}
