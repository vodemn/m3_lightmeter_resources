import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/nd_value.dart';

void main() {
  const a = NdValue(0);
  const b = NdValue(0);
  const c = NdValue(4);
  const d = NdValue(8);

  test('difference', () {
    expect(a.difference(b), 0.0);
    expect(b.difference(a), 0.0);
    expect(a.difference(c), 2);
    expect(c.difference(a), -2);
    expect(a.difference(d), 3);
    expect(d.difference(a), -3);
  });

  test('toStringDifference', () {
    expect(a.toStringDifference(b), "0.0");
    expect(b.toStringDifference(a), "0.0");
    expect(a.toStringDifference(c), "+2.0");
    expect(c.toStringDifference(a), "-2.0");
    expect(a.toStringDifference(d), "+3.0");
    expect(d.toStringDifference(a), "-3.0");
  });

  test('stopReduction', () {
    expect(a.stopReduction, 0);
    expect(b.stopReduction, 0);
    expect(c.stopReduction, 2);
  });

  test('toString()', () {
    expect(a.toString(), "ND0");
    expect(b.toString(), "ND0");
    expect(c.toString(), "ND4");
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
