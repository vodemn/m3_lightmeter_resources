import 'package:m3_lightmeter_resources/src/data/models/optional.dart';
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

  /// This value can be set after the fact,
  /// depending on what exposure pair was used to take a shot.
  final ApertureValue? apertureValue;

  /// This value can be set after the fact,
  /// depending on what exposure pair was used to take a shot.
  final ShutterSpeedValue? shutterSpeedValue;

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
    this.note = '',
  });

  LogbookPhoto copyWith({
    Optional<ApertureValue>? apertureValue,
    Optional<ShutterSpeedValue>? shutterSpeedValue,
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
