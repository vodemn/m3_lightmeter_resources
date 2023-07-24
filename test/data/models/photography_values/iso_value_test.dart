import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/iso_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/photography_value.dart';

void main() {
  const a = IsoValue(100, StopType.full);
  const b = IsoValue(100, StopType.full);
  const c = IsoValue(125, StopType.third);
  const d = IsoValue(160, StopType.third);

  test('difference', () {
    expect(a.difference(b), 0.0);
    expect(b.difference(a), 0.0);
    expect(a.difference(c), 0.3);
    expect(c.difference(a), -0.3);
    expect(a.difference(d), 0.7);
    expect(d.difference(a), -0.7);
  });

  test('toStringDifference', () {
    expect(a.toStringDifference(b), "0.0");
    expect(b.toStringDifference(a), "0.0");
    expect(a.toStringDifference(c), "+0.3");
    expect(c.toStringDifference(a), "-0.3");
    expect(a.toStringDifference(d), "+0.7");
    expect(d.toStringDifference(a), "-0.7");
  });

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
