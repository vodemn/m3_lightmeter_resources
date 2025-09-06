import 'package:flutter/foundation.dart';
import 'package:m3_lightmeter_resources/src/utils/identifiable.dart';

import 'photography_values/aperture_value.dart';
import 'photography_values/iso_value.dart';
import 'photography_values/nd_value.dart';
import 'photography_values/shutter_speed_value.dart';

sealed class IEquipmentProfile implements Identifiable {
  @override
  final String id;
  @override
  final String name;
  final List<IsoValue> isoValues;
  final List<NdValue> ndValues;
  final double lensZoom;
  final double exposureOffset;

  const IEquipmentProfile({
    required this.id,
    required this.name,
    required this.isoValues,
    required this.ndValues,
    this.lensZoom = 1.0,
    this.exposureOffset = 0.0,
  });
}

final class EquipmentProfile extends IEquipmentProfile {
  final List<ApertureValue> apertureValues;
  final List<ShutterSpeedValue> shutterSpeedValues;

  const EquipmentProfile({
    required super.id,
    required super.name,
    required this.apertureValues,
    required this.shutterSpeedValues,
    required super.ndValues,
    required super.isoValues,
    super.lensZoom = 1.0,
    super.exposureOffset = 0.0,
  });

  EquipmentProfile copyWith({
    String? name,
    List<ApertureValue>? apertureValues,
    List<NdValue>? ndValues,
    List<ShutterSpeedValue>? shutterSpeedValues,
    List<IsoValue>? isoValues,
    double? lensZoom,
    double? exposureOffset,
  }) =>
      EquipmentProfile(
        id: id,
        name: name ?? this.name,
        apertureValues: apertureValues ?? this.apertureValues,
        ndValues: ndValues ?? this.ndValues,
        shutterSpeedValues: shutterSpeedValues ?? this.shutterSpeedValues,
        isoValues: isoValues ?? this.isoValues,
        lensZoom: lensZoom ?? this.lensZoom,
        exposureOffset: exposureOffset ?? this.exposureOffset,
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
        other.lensZoom == lensZoom &&
        other.exposureOffset == exposureOffset;
  }

  @override
  int get hashCode => Object.hash(id, name, runtimeType);
}

final class PinholeEquipmentProfile extends IEquipmentProfile {
  final double aperture;

  const PinholeEquipmentProfile({
    required super.id,
    required super.name,
    required this.aperture,
    required super.isoValues,
    required super.ndValues,
    super.lensZoom = 1.0,
    super.exposureOffset = 0.0,
  });

  PinholeEquipmentProfile copyWith({
    String? name,
    double? aperture,
    List<IsoValue>? isoValues,
    List<NdValue>? ndValues,
    double? lensZoom,
    double? exposureOffset,
  }) =>
      PinholeEquipmentProfile(
        id: id,
        name: name ?? this.name,
        aperture: aperture ?? this.aperture,
        isoValues: isoValues ?? this.isoValues,
        ndValues: ndValues ?? this.ndValues,
        lensZoom: lensZoom ?? this.lensZoom,
        exposureOffset: exposureOffset ?? this.exposureOffset,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is PinholeEquipmentProfile &&
        other.id == id &&
        other.name == name &&
        aperture == other.aperture &&
        listEquals(isoValues, other.isoValues) &&
        listEquals(ndValues, other.ndValues) &&
        other.lensZoom == lensZoom &&
        other.exposureOffset == exposureOffset;
  }

  @override
  int get hashCode => Object.hash(id, name, runtimeType);
}
