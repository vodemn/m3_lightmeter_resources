import 'package:m3_lightmeter_resources/src/utils/optional.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/aperture_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/shutter_speed_value.dart';
import 'package:m3_lightmeter_resources/src/utils/identifiable.dart';

final class LogbookPhoto implements Identifiable {
  @override
  final String id;
  @override
  final String name;

  final DateTime timestamp;
  final double ev;
  final int iso;
  final int nd;
  final Coordinates? coordinates;

  final ApertureValue? apertureValue;
  final ShutterSpeedValue? shutterSpeedValue;
  final String? equipmentProfileId;
  final String? filmId;

  final String note;

  const LogbookPhoto({
    required this.id,
    required this.name,
    required this.timestamp,
    required this.ev,
    required this.iso,
    required this.nd,
    this.coordinates,
    this.apertureValue,
    this.shutterSpeedValue,
    this.equipmentProfileId,
    this.filmId,
    this.note = '',
  });

  LogbookPhoto copyWith({
    Optional<ApertureValue>? apertureValue,
    Optional<ShutterSpeedValue>? shutterSpeedValue,
    Optional<String>? equipmentProfileId,
    Optional<String>? filmId,
    String? note,
  }) =>
      LogbookPhoto(
        id: id,
        name: name,
        timestamp: timestamp,
        ev: ev,
        iso: iso,
        nd: nd,
        coordinates: coordinates,
        apertureValue: apertureValue != null ? apertureValue.value : this.apertureValue,
        shutterSpeedValue: shutterSpeedValue != null ? shutterSpeedValue.value : this.shutterSpeedValue,
        equipmentProfileId: equipmentProfileId != null ? equipmentProfileId.value : this.equipmentProfileId,
        filmId: filmId != null ? filmId.value : this.filmId,
        note: note ?? this.note,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is LogbookPhoto &&
        other.id == id &&
        other.name == name &&
        other.timestamp == timestamp &&
        other.ev == ev &&
        other.iso == iso &&
        other.nd == nd &&
        other.coordinates == coordinates &&
        other.apertureValue == apertureValue &&
        other.shutterSpeedValue == shutterSpeedValue &&
        other.equipmentProfileId == equipmentProfileId &&
        other.filmId == filmId &&
        other.note == note;
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        id,
        name,
        timestamp,
        ev,
        iso,
        nd,
        coordinates,
        apertureValue,
        shutterSpeedValue,
        equipmentProfileId,
        filmId,
        note,
      );
}

final class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates(this.latitude, this.longitude);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Coordinates && other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);
}
