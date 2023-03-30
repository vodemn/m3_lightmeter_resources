import 'package:m3_lightmeter_resources/src/data/models/photography_values/iso_value.dart';

class Film {
  final String brand;
  final String model;
  final IsoValue value;

  const Film(this.brand, this.model, this.value);

  @override
  String toString() => "$brand $model";
}
