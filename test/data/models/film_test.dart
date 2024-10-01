import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/film.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/photography_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/shutter_speed_value.dart';

void main() {
  const a = Film(name: 'Film 1', iso: 100);
  const b = Film(name: 'Film 1', iso: 100);
  const c = Film(name: 'Film 2', iso: 100);

  test('iso', () {
    expect(const Film.other().iso, 0);
  });

  test('toString()', () {
    expect(const Film.other().toString(), "");
  });

  test('==', () {
    expect(const Film.other() == Film.values[0], true);
    expect(a == b, true);
    expect(a == const Film.other(), false);
    expect(a == c, false);
  });

  test('hashCode', () {
    expect(const Film.other().hashCode == Film.values[0].hashCode, true);
    expect(a.hashCode == b.hashCode, true);
    expect(a.hashCode == const Film.other().hashCode, false);
    expect(a.hashCode == c.hashCode, false);
  });

  group(
    'reciprocityFailure',
    () {
      test(
        'no formula',
        () {
          expect(
            const Film.other().reciprocityFailure(const ShutterSpeedValue(1000, true, StopType.full)),
            const ShutterSpeedValue(1000, true, StopType.full),
          );
          expect(
            const Film.other().reciprocityFailure(const ShutterSpeedValue(1, false, StopType.full)),
            const ShutterSpeedValue(1, false, StopType.full),
          );
          expect(
            const Film.other().reciprocityFailure(const ShutterSpeedValue(16, false, StopType.full)),
            const ShutterSpeedValue(16, false, StopType.full),
          );
        },
      );

      test(
        'has formula',
        () {
          final film = Film(name: 'Film 2', iso: 100, reciprocityFormula: (t) => t * 2);
          expect(
            film.reciprocityFailure(const ShutterSpeedValue(1000, true, StopType.full)),
            const ShutterSpeedValue(1000, true, StopType.full),
          );
          expect(
            film.reciprocityFailure(const ShutterSpeedValue(1, false, StopType.full)),
            const ShutterSpeedValue(2, false, StopType.full),
          );
          expect(
            film.reciprocityFailure(const ShutterSpeedValue(16, false, StopType.full)),
            const ShutterSpeedValue(32, false, StopType.full),
          );
        },
      );
    },
  );
}
