import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/iso_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/photography_value.dart';

void main() {
  const a = IsoValue(100, StopType.full);
  const b = IsoValue(100, StopType.full);
  const c = IsoValue(125, StopType.third);

  test('toString()', () {
    expect(a.toString(), "100");
    expect(b.toString(), "100");
    expect(c.toString(), "125");
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
