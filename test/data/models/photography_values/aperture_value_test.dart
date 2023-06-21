import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/aperture_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/photography_value.dart';

void main() {
  const a = ApertureValue(1.4, StopType.full);
  const b = ApertureValue(1.4, StopType.full);
  const c = ApertureValue(16, StopType.full);

  test('toString()', () {
    expect(a.toString(), "f/1.4");
    expect(b.toString(), "f/1.4");
    expect(c.toString(), "f/16");
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
