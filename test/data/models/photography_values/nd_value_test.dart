import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/nd_value.dart';

void main() {
  const a = NdValue(2);
  const b = NdValue(2);
  const c = NdValue(4);

  test('stopReduction', () {
    expect(a.stopReduction, 1);
    expect(b.stopReduction, 1);
    expect(c.stopReduction, 2);
  });

  test('toString()', () {
    expect(a.toString(), "ND2");
    expect(b.toString(), "ND2");
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
