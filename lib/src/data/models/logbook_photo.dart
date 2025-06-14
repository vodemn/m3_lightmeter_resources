import 'package:m3_lightmeter_resources/src/data/models/photography_values/aperture_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/shutter_speed_value.dart';
import 'package:m3_lightmeter_resources/src/utils/identifiable.dart';

final class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates(this.latitude, this.longitude);
}

final class LogbookPhoto implements Identifiable {
  @override
  final String id;
  @override
  final String name;
  final DateTime timestamp;
  final ApertureValue apertureValue;
  final ShutterSpeedValue shutterSpeedValue;
  final int iso;
  final Coordinates? coordinates;
  final String note;

  const LogbookPhoto({
    required this.id,
    required this.name,
    required this.timestamp,
    required this.apertureValue,
    required this.shutterSpeedValue,
    required this.iso,
    this.coordinates,
    this.note = '',
  });

  LogbookPhoto copyWith({
    String? note,
  }) =>
      LogbookPhoto(
        id: id,
        name: name,
        timestamp: timestamp,
        apertureValue: apertureValue,
        shutterSpeedValue: shutterSpeedValue,
        iso: iso,
        coordinates: coordinates,
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
        other.apertureValue == apertureValue &&
        other.shutterSpeedValue == shutterSpeedValue &&
        other.iso == iso &&
        other.coordinates == coordinates &&
        other.note == note;
  }

  @override
  int get hashCode => Object.hash(id, name, runtimeType);
}
