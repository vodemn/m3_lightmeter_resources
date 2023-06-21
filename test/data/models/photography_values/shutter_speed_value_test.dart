import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/photography_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/shutter_speed_value.dart';

void main() {
  const a = ShutterSpeedValue(1.3, true, StopType.full);
  const b = ShutterSpeedValue(1.3, true, StopType.full);
  const c = ShutterSpeedValue(1, false, StopType.full);

  test('value', () {
    expect(a.value, 1 / 1.3);
    expect(b.value, 1 / 1.3);
    expect(c.value, 1);
  });

  test('toString()', () {
    expect(a.toString(), "1/1.3");
    expect(b.toString(), "1/1.3");
    expect(c.toString(), "1\"");
  });

  test('==', () {
    expect(a == b && b == a, true);
    expect(a != c && c != a, true);
    expect(b != c && c != b, true);
  });

  test('hashCode', () {
    expect(a.hashCode == b.hashCode, true);
    expect(a.hashCode != c.hashCode, true);
    expect(b.hashCode != c.hashCode, true);
  });
}
