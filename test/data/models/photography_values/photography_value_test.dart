import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/iso_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/photography_value.dart';

void main() {
  const a = IsoValue(100, StopType.full);
  const b = IsoValue(100, StopType.full);
  const c = IsoValue(125, StopType.third);

  test('difference', () {
    expect(a.difference(b), 0.0);
    expect(b.difference(a), 0.0);
    expect(a.difference(c), 0.3);
    expect(c.difference(a), -0.3);
  });

  test('toStringDifference', () {
    expect(a.toStringDifference(b), "0.0");
    expect(b.toStringDifference(a), "0.0");
    expect(a.toStringDifference(c), "+0.3");
    expect(c.toStringDifference(a), "-0.3");
  });
}
