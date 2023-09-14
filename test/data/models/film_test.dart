import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/m3_lightmeter_resources.dart';
import 'package:m3_lightmeter_resources/src/data/models/film.dart';

void main() {
  test('iso', () {
    expect(const Film.other().iso, 0);
  });

  test('toString()', () {
    expect(const Film.other().toString(), "");
  });

  test('==', () {
    expect(const Film.other() == Film.values[0], true);
    expect(const Film('Film 1', 100) == const Film('Film 1', 100), true);
    expect(const Film('Film 1', 100) == const Film.other(), false);
    expect(const Film('Film 1', 100) == const Film('Film 2', 100), false);
  });

  test('hashCode', () {
    expect(const Film.other().hashCode == Film.values[0].hashCode, true);
    expect(const Film('Film 1', 100).hashCode == const Film('Film 1', 100).hashCode, true);
    expect(const Film('Film 1', 100).hashCode == const Film.other().hashCode, false);
    expect(const Film('Film 1', 100).hashCode == const Film('Film 2', 100).hashCode, false);
  });

  test(
    'reciprocityFailure',
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
}
