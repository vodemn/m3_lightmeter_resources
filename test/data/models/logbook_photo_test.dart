import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/logbook_photo.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/aperture_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/photography_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/shutter_speed_value.dart';
import 'package:m3_lightmeter_resources/src/utils/optional.dart';

void main() {
  final baseTimestamp = DateTime(2023, 1, 1, 12, 0, 0);
  const coordinates1 = Coordinates(37.7749, -122.4194); // San Francisco
  const coordinates2 = Coordinates(40.7128, -74.0060); // New York

  const apertureValue1 = ApertureValue(2.8, StopType.full);
  const apertureValue2 = ApertureValue(5.6, StopType.full);
  const shutterSpeedValue1 = ShutterSpeedValue(125, true, StopType.full);
  const shutterSpeedValue2 = ShutterSpeedValue(250, true, StopType.full);

  // Test objects
  final logbookPhoto1 = LogbookPhoto(
    id: "photo1",
    name: "Test Photo 1",
    timestamp: baseTimestamp,
    ev: 10.0,
    iso: 100,
    nd: 0,
    coordinates: coordinates1,
    apertureValue: apertureValue1,
    shutterSpeedValue: shutterSpeedValue1,
    equipmentProfileId: "profile1",
    filmId: "film1",
    note: "Test note",
  );

  final logbookPhoto2 = LogbookPhoto(
    id: "photo1",
    name: "Test Photo 1",
    timestamp: baseTimestamp,
    ev: 10.0,
    iso: 100,
    nd: 0,
    coordinates: coordinates1,
    apertureValue: apertureValue1,
    shutterSpeedValue: shutterSpeedValue1,
    equipmentProfileId: "profile1",
    filmId: "film1",
    note: "Test note",
  );

  final logbookPhoto3 = LogbookPhoto(
    id: "photo2",
    name: "Test Photo 2",
    timestamp: baseTimestamp.add(const Duration(hours: 1)),
    ev: 12.0,
    iso: 200,
    nd: 1,
    coordinates: coordinates2,
    apertureValue: apertureValue2,
    shutterSpeedValue: shutterSpeedValue2,
    equipmentProfileId: "profile2",
    filmId: "film2",
    note: "Different note",
  );

  final logbookPhotoMinimal = LogbookPhoto(
    id: "photo_minimal",
    name: "Minimal Photo",
    timestamp: baseTimestamp,
    ev: 8.0,
    iso: 100,
    nd: 0,
  );

  group('LogbookPhoto', () {
    group('== operator', () {
      test('returns true for identical objects', () {
        expect(identical(logbookPhoto1, logbookPhoto1), true);
        expect(logbookPhoto1 == logbookPhoto1, true);
      });

      test('returns true for objects with same values', () {
        expect(logbookPhoto1 == logbookPhoto2, true);
        expect(logbookPhoto2 == logbookPhoto1, true);
      });

      test('returns false for objects with different values', () {
        expect(logbookPhoto1 == logbookPhoto3, false);
        expect(logbookPhoto3 == logbookPhoto1, false);
        expect(logbookPhoto2 == logbookPhoto3, false);
      });

      test('returns false for objects with different id', () {
        final modifiedId = LogbookPhoto(
          id: "different_id",
          name: logbookPhoto1.name,
          timestamp: logbookPhoto1.timestamp,
          ev: logbookPhoto1.ev,
          iso: logbookPhoto1.iso,
          nd: logbookPhoto1.nd,
          coordinates: logbookPhoto1.coordinates,
          apertureValue: logbookPhoto1.apertureValue,
          shutterSpeedValue: logbookPhoto1.shutterSpeedValue,
          equipmentProfileId: logbookPhoto1.equipmentProfileId,
          filmId: logbookPhoto1.filmId,
          note: logbookPhoto1.note,
        );
        expect(logbookPhoto1 == modifiedId, false);
      });

      test('returns false for objects with different name', () {
        final modifiedName = LogbookPhoto(
          id: logbookPhoto1.id,
          name: "Different Name",
          timestamp: logbookPhoto1.timestamp,
          ev: logbookPhoto1.ev,
          iso: logbookPhoto1.iso,
          nd: logbookPhoto1.nd,
          coordinates: logbookPhoto1.coordinates,
          apertureValue: logbookPhoto1.apertureValue,
          shutterSpeedValue: logbookPhoto1.shutterSpeedValue,
          equipmentProfileId: logbookPhoto1.equipmentProfileId,
          filmId: logbookPhoto1.filmId,
          note: logbookPhoto1.note,
        );
        expect(logbookPhoto1 == modifiedName, false);
      });

      test('returns false for objects with different timestamp', () {
        final modifiedTimestamp = LogbookPhoto(
          id: logbookPhoto1.id,
          name: logbookPhoto1.name,
          timestamp: logbookPhoto1.timestamp.add(const Duration(seconds: 1)),
          ev: logbookPhoto1.ev,
          iso: logbookPhoto1.iso,
          nd: logbookPhoto1.nd,
          coordinates: logbookPhoto1.coordinates,
          apertureValue: logbookPhoto1.apertureValue,
          shutterSpeedValue: logbookPhoto1.shutterSpeedValue,
          equipmentProfileId: logbookPhoto1.equipmentProfileId,
          filmId: logbookPhoto1.filmId,
          note: logbookPhoto1.note,
        );
        expect(logbookPhoto1 == modifiedTimestamp, false);
      });

      test('returns false for objects with different coordinates', () {
        final modifiedCoordinates = LogbookPhoto(
          id: logbookPhoto1.id,
          name: logbookPhoto1.name,
          timestamp: logbookPhoto1.timestamp,
          ev: logbookPhoto1.ev,
          iso: logbookPhoto1.iso,
          nd: logbookPhoto1.nd,
          coordinates: coordinates2,
          apertureValue: logbookPhoto1.apertureValue,
          shutterSpeedValue: logbookPhoto1.shutterSpeedValue,
          equipmentProfileId: logbookPhoto1.equipmentProfileId,
          filmId: logbookPhoto1.filmId,
          note: logbookPhoto1.note,
        );
        expect(logbookPhoto1 == modifiedCoordinates, false);
      });

      test('returns false for objects with null vs non-null optional fields', () {
        expect(logbookPhoto1 == logbookPhotoMinimal, false);
        expect(logbookPhotoMinimal == logbookPhoto1, false);
      });
    });

    group('hashCode', () {
      test('returns same hashCode for equal objects', () {
        expect(logbookPhoto1.hashCode == logbookPhoto2.hashCode, true);
      });

      test('returns different hashCode for different objects', () {
        expect(logbookPhoto1.hashCode != logbookPhoto3.hashCode, true);
        expect(logbookPhoto2.hashCode != logbookPhoto3.hashCode, true);
        expect(logbookPhoto1.hashCode != logbookPhotoMinimal.hashCode, true);
      });

      test('hashCode is consistent across multiple calls', () {
        final hashCode1 = logbookPhoto1.hashCode;
        final hashCode2 = logbookPhoto1.hashCode;
        expect(hashCode1 == hashCode2, true);
      });
    });

    group('copyWith', () {
      test('returns identical object when no parameters provided', () {
        final copied = logbookPhoto1.copyWith();
        expect(copied == logbookPhoto1, true);
        expect(copied.id, logbookPhoto1.id);
        expect(copied.name, logbookPhoto1.name);
        expect(copied.timestamp, logbookPhoto1.timestamp);
        expect(copied.ev, logbookPhoto1.ev);
        expect(copied.iso, logbookPhoto1.iso);
        expect(copied.nd, logbookPhoto1.nd);
        expect(copied.coordinates, logbookPhoto1.coordinates);
        expect(copied.apertureValue, logbookPhoto1.apertureValue);
        expect(copied.shutterSpeedValue, logbookPhoto1.shutterSpeedValue);
        expect(copied.equipmentProfileId, logbookPhoto1.equipmentProfileId);
        expect(copied.filmId, logbookPhoto1.filmId);
        expect(copied.note, logbookPhoto1.note);
      });

      test('updates apertureValue when provided', () {
        final copied = logbookPhoto1.copyWith(
          apertureValue: const Optional(apertureValue2),
        );
        expect(copied.apertureValue, apertureValue2);
        expect(copied.shutterSpeedValue, logbookPhoto1.shutterSpeedValue);
        expect(copied.equipmentProfileId, logbookPhoto1.equipmentProfileId);
        expect(copied.filmId, logbookPhoto1.filmId);
        expect(copied.note, logbookPhoto1.note);
      });

      test('sets apertureValue to null when Optional(null) provided', () {
        final copied = logbookPhoto1.copyWith(
          apertureValue: const Optional(null),
        );
        expect(copied.apertureValue, null);
        expect(copied.shutterSpeedValue, logbookPhoto1.shutterSpeedValue);
        expect(copied.equipmentProfileId, logbookPhoto1.equipmentProfileId);
        expect(copied.filmId, logbookPhoto1.filmId);
        expect(copied.note, logbookPhoto1.note);
      });

      test('updates shutterSpeedValue when provided', () {
        final copied = logbookPhoto1.copyWith(
          shutterSpeedValue: const Optional(shutterSpeedValue2),
        );
        expect(copied.apertureValue, logbookPhoto1.apertureValue);
        expect(copied.shutterSpeedValue, shutterSpeedValue2);
        expect(copied.equipmentProfileId, logbookPhoto1.equipmentProfileId);
        expect(copied.filmId, logbookPhoto1.filmId);
        expect(copied.note, logbookPhoto1.note);
      });

      test('sets shutterSpeedValue to null when Optional(null) provided', () {
        final copied = logbookPhoto1.copyWith(
          shutterSpeedValue: const Optional(null),
        );
        expect(copied.apertureValue, logbookPhoto1.apertureValue);
        expect(copied.shutterSpeedValue, null);
        expect(copied.equipmentProfileId, logbookPhoto1.equipmentProfileId);
        expect(copied.filmId, logbookPhoto1.filmId);
        expect(copied.note, logbookPhoto1.note);
      });

      test('updates equipmentProfileId when provided', () {
        final copied = logbookPhoto1.copyWith(
          equipmentProfileId: const Optional("new_profile"),
        );
        expect(copied.apertureValue, logbookPhoto1.apertureValue);
        expect(copied.shutterSpeedValue, logbookPhoto1.shutterSpeedValue);
        expect(copied.equipmentProfileId, "new_profile");
        expect(copied.filmId, logbookPhoto1.filmId);
        expect(copied.note, logbookPhoto1.note);
      });

      test('sets equipmentProfileId to null when Optional(null) provided', () {
        final copied = logbookPhoto1.copyWith(
          equipmentProfileId: const Optional(null),
        );
        expect(copied.apertureValue, logbookPhoto1.apertureValue);
        expect(copied.shutterSpeedValue, logbookPhoto1.shutterSpeedValue);
        expect(copied.equipmentProfileId, null);
        expect(copied.filmId, logbookPhoto1.filmId);
        expect(copied.note, logbookPhoto1.note);
      });

      test('updates filmId when provided', () {
        final copied = logbookPhoto1.copyWith(
          filmId: const Optional("new_film"),
        );
        expect(copied.apertureValue, logbookPhoto1.apertureValue);
        expect(copied.shutterSpeedValue, logbookPhoto1.shutterSpeedValue);
        expect(copied.equipmentProfileId, logbookPhoto1.equipmentProfileId);
        expect(copied.filmId, "new_film");
        expect(copied.note, logbookPhoto1.note);
      });

      test('sets filmId to null when Optional(null) provided', () {
        final copied = logbookPhoto1.copyWith(
          filmId: const Optional(null),
        );
        expect(copied.apertureValue, logbookPhoto1.apertureValue);
        expect(copied.shutterSpeedValue, logbookPhoto1.shutterSpeedValue);
        expect(copied.equipmentProfileId, logbookPhoto1.equipmentProfileId);
        expect(copied.filmId, null);
        expect(copied.note, logbookPhoto1.note);
      });

      test('updates note when provided', () {
        final copied = logbookPhoto1.copyWith(note: "Updated note");
        expect(copied.apertureValue, logbookPhoto1.apertureValue);
        expect(copied.shutterSpeedValue, logbookPhoto1.shutterSpeedValue);
        expect(copied.equipmentProfileId, logbookPhoto1.equipmentProfileId);
        expect(copied.filmId, logbookPhoto1.filmId);
        expect(copied.note, "Updated note");
      });

      test('updates multiple fields simultaneously', () {
        final copied = logbookPhoto1.copyWith(
          apertureValue: const Optional(apertureValue2),
          shutterSpeedValue: const Optional(shutterSpeedValue2),
          equipmentProfileId: const Optional("new_profile"),
          filmId: const Optional("new_film"),
          note: "Updated note",
        );
        expect(copied.apertureValue, apertureValue2);
        expect(copied.shutterSpeedValue, shutterSpeedValue2);
        expect(copied.equipmentProfileId, "new_profile");
        expect(copied.filmId, "new_film");
        expect(copied.note, "Updated note");

        // Verify unchanged fields
        expect(copied.id, logbookPhoto1.id);
        expect(copied.name, logbookPhoto1.name);
        expect(copied.timestamp, logbookPhoto1.timestamp);
        expect(copied.ev, logbookPhoto1.ev);
        expect(copied.iso, logbookPhoto1.iso);
        expect(copied.nd, logbookPhoto1.nd);
        expect(copied.coordinates, logbookPhoto1.coordinates);
      });

      test('works with minimal object (null optional fields)', () {
        final copied = logbookPhotoMinimal.copyWith(
          apertureValue: const Optional(apertureValue1),
          note: "Added note",
        );
        expect(copied.apertureValue, apertureValue1);
        expect(copied.shutterSpeedValue, null);
        expect(copied.equipmentProfileId, null);
        expect(copied.filmId, null);
        expect(copied.note, "Added note");
      });
    });
  });

  group('Coordinates', () {
    const coord1 = Coordinates(37.7749, -122.4194);
    const coord2 = Coordinates(37.7749, -122.4194);
    const coord3 = Coordinates(40.7128, -74.0060);

    group('== operator', () {
      test('returns true for identical objects', () {
        expect(identical(coord1, coord1), true);
        expect(coord1 == coord1, true);
      });

      test('returns true for objects with same values', () {
        expect(coord1 == coord2, true);
        expect(coord2 == coord1, true);
      });

      test('returns false for objects with different values', () {
        expect(coord1 == coord3, false);
        expect(coord3 == coord1, false);
      });

      test('returns false for objects with different latitude', () {
        const differentLat = Coordinates(38.0, -122.4194);
        expect(coord1 == differentLat, false);
      });

      test('returns false for objects with different longitude', () {
        const differentLon = Coordinates(37.7749, -123.0);
        expect(coord1 == differentLon, false);
      });
    });

    group('hashCode', () {
      test('returns same hashCode for equal objects', () {
        expect(coord1.hashCode == coord2.hashCode, true);
      });

      test('returns different hashCode for different objects', () {
        expect(coord1.hashCode != coord3.hashCode, true);
      });

      test('hashCode is consistent across multiple calls', () {
        final hashCode1 = coord1.hashCode;
        final hashCode2 = coord1.hashCode;
        expect(hashCode1 == hashCode2, true);
      });
    });
  });
}
