import 'package:flutter/foundation.dart';

import 'photography_values/aperture_value.dart';
import 'photography_values/iso_value.dart';
import 'photography_values/nd_value.dart';
import 'photography_values/shutter_speed_value.dart';

class EquipmentProfile {
  final String id;
  final String name;
  final List<ApertureValue> apertureValues;
  final List<NdValue> ndValues;
  final List<ShutterSpeedValue> shutterSpeedValues;
  final List<IsoValue> isoValues;
  final double lensZoom;

  const EquipmentProfile({
    required this.id,
    required this.name,
    required this.apertureValues,
    required this.ndValues,
    required this.shutterSpeedValues,
    required this.isoValues,
    this.lensZoom = 1.0,
  });

  EquipmentProfile copyWith({
    String? name,
    List<ApertureValue>? apertureValues,
    List<NdValue>? ndValues,
    List<ShutterSpeedValue>? shutterSpeedValues,
    List<IsoValue>? isoValues,
    double? lensZoom,
  }) =>
      EquipmentProfile(
        id: id,
        name: name ?? this.name,
        apertureValues: apertureValues ?? this.apertureValues,
        ndValues: ndValues ?? this.ndValues,
        shutterSpeedValues: shutterSpeedValues ?? this.shutterSpeedValues,
        isoValues: isoValues ?? this.isoValues,
        lensZoom: lensZoom ?? this.lensZoom,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is EquipmentProfile &&
        other.id == id &&
        other.name == name &&
        apertureValues.first == other.apertureValues.first &&
        apertureValues.last == other.apertureValues.last &&
        listEquals(ndValues, other.ndValues) &&
        shutterSpeedValues.first == other.shutterSpeedValues.first &&
        shutterSpeedValues.last == other.shutterSpeedValues.last &&
        listEquals(isoValues, other.isoValues) &&
        other.lensZoom == lensZoom;
  }

  @override
  int get hashCode => Object.hash(id, name, runtimeType);
}
