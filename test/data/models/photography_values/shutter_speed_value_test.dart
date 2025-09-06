import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/photography_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/shutter_speed_value.dart';

void main() {
  const a = ShutterSpeedValue(1.3, true, StopType.full);
  const b = ShutterSpeedValue(1.3, true, StopType.full);
  const c = ShutterSpeedValue(1, false, StopType.full);

  test('Difference', () {
    expect(a.difference(b), 0.0);
    expect(b.difference(a), 0.0);
    expect(a.difference(c), 0.4);
    expect(c.difference(a), -0.4);
  });

  test('ToStringDifference', () {
    expect(
      a.toStringDifference(b),
      "0.0",
    );
    expect(
      b.toStringDifference(a),
      "0.0",
    );
    expect(
      a.toStringDifference(c),
      "+0.4",
    );
    expect(
      c.toStringDifference(a),
      "-0.4",
    );
  });

  test('Value', () {
    expect(a.value, 1 / 1.3);
    expect(b.value, 1 / 1.3);
    expect(c.value, 1);
  });

  test('toString()', () {
    expect(
      a.toString(),
      "1/1.3",
    );
    expect(
      b.toString(),
      "1/1.3",
    );
    expect(
      c.toString(),
      "1s",
    );
    expect(
      const ShutterSpeedValue(60, false, StopType.full).toString(),
      "1m 0s",
    );
    expect(
      const ShutterSpeedValue(128, false, StopType.full).toString(),
      "2m 8s",
    );
    expect(
      const ShutterSpeedValue(3600, false, StopType.full).toString(),
      "1h 0m",
    );
    expect(
      const ShutterSpeedValue(65536, false, StopType.full).toString(),
      "18h 12m",
    );
  });

  test('Equality', () {
    expect(a == b && b == a, true);
    expect(a != c && c != a, true);
    expect(b != c && c != b, true);
  });

  test('HashCode', () {
    expect(a.hashCode == b.hashCode, true);
    expect(a.hashCode != c.hashCode, true);
    expect(b.hashCode != c.hashCode, true);
  });

  group('toString() comprehensive tests', () {
    test('Fraction formatting (isFraction = true)', () {
      expect(
        const ShutterSpeedValue(1000, true, StopType.full).toString(),
        "1/1000",
        reason: "Integer fractions must format as 1/denominator",
      );
      expect(
        const ShutterSpeedValue(1.3, true, StopType.full).toString(),
        "1/1.3",
        reason: "Decimal fractions must format as 1/decimal",
      );
      expect(
        const ShutterSpeedValue(0.5, true, StopType.full).toString(),
        "1/0.5",
        reason: "Very small fractions must format as 1/decimal",
      );
    });

    test('Seconds formatting (< 1 minute)', () {
      expect(
        const ShutterSpeedValue(1.0, false, StopType.full).toString(),
        "1s",
        reason: "Exactly 1 second must show as 1s",
      );
      expect(
        const ShutterSpeedValue(1.4, false, StopType.full).toString(),
        "1s",
        reason: "1.4 seconds must round to 1s",
      );
      expect(
        const ShutterSpeedValue(10.0, false, StopType.full).toString(),
        "10s",
        reason: "1-59 seconds must round to the nearest whole second",
      );
      expect(
        const ShutterSpeedValue(10.5, false, StopType.full).toString(),
        "11s",
        reason: "Rounding at the 0.5 boundary must round up",
      );
    });

    test('Minutes:seconds formatting (1m-59m)', () {
      expect(
        const ShutterSpeedValue(60.0, false, StopType.full).toString(),
        "1m 0s",
        reason: "Exact minutes must format as Mm 0s",
      );
      expect(
        const ShutterSpeedValue(92.0, false, StopType.full).toString(),
        "1m 32s",
        reason: "Minutes with seconds must format as Mm Ss",
      );
      expect(
        const ShutterSpeedValue(90.6, false, StopType.full).toString(),
        "1m 31s",
        reason: "Must round to the nearest second",
      );
    });

    test('Hours:minutes formatting (1h-23h)', () {
      expect(
        const ShutterSpeedValue(3600.0, false, StopType.full).toString(),
        "1h 0m",
        reason: "Exact hours must format as Hh 0m",
      );
      expect(
        const ShutterSpeedValue(3630.0, false, StopType.full).toString(),
        "1h 1m",
        reason: "Must round to the nearest minute",
      );
      expect(
        const ShutterSpeedValue(5400.0, false, StopType.full).toString(),
        "1h 30m",
        reason: "Hours with minutes must format as Hh Mm",
      );
      expect(
        const ShutterSpeedValue(7200.0, false, StopType.full).toString(),
        "2h 0m",
        reason: "Rounding must work across hour boundaries",
      );
    });

    test('Days:hours formatting (1d-29d)', () {
      expect(
        const ShutterSpeedValue(86400.0, false, StopType.full).toString(),
        "1d 0h",
        reason: "Exact days must format as Dd 0h",
      );
      expect(
        const ShutterSpeedValue(90000.0, false, StopType.full).toString(),
        "1d 1h",
        reason: "Must round to the nearest hour",
      );
      expect(
        const ShutterSpeedValue(129600.0, false, StopType.full).toString(),
        "1d 12h",
        reason: "Various day ranges must format as Dd Hh",
      );
    });

    test('Long exposure formatting (≥30d)', () {
      expect(
        const ShutterSpeedValue(2592000.0, false, StopType.full).toString(),
        "30d",
        reason: "30+ days must format as days only",
      );
      expect(
        const ShutterSpeedValue(3024000.0, false, StopType.full).toString(),
        "35d",
        reason: "Various day counts must format correctly",
      );
      expect(
        const ShutterSpeedValue(2664000.0, false, StopType.full).toString(),
        "31d",
        reason: "Must round to the nearest day",
      );
    });

    test('Boundary values', () {
      expect(
        const ShutterSpeedValue(1.0, false, StopType.full).toString(),
        "1s",
        reason: "Boundary between <1s and 1s-59s ranges",
      );
      expect(
        const ShutterSpeedValue(60.0, false, StopType.full).toString(),
        "1m 0s",
        reason: "Boundary between 1s-59s and 1m-59m ranges",
      );
      expect(
        const ShutterSpeedValue(3600.0, false, StopType.full).toString(),
        "1h 0m",
        reason: "Boundary between 1m-59m and 1h-23h ranges",
      );
      expect(
        const ShutterSpeedValue(86400.0, false, StopType.full).toString(),
        "1d 0h",
        reason: "Boundary between 1h-23h and 1d-29d ranges",
      );
      expect(
        const ShutterSpeedValue(2592000.0, false, StopType.full).toString(),
        "30d",
        reason: "Boundary between 1d-29d and 30d+ ranges",
      );
    });

    test('Rounding and formatting edge cases', () {
      expect(
        const ShutterSpeedValue(10.55, false, StopType.full).toString(),
        "11s",
        reason: "Rounding must work in the 1s-59s range",
      );
      expect(
        const ShutterSpeedValue(1.5, false, StopType.full).toString(),
        "2s",
        reason: "Rounding must work for decimal seconds",
      );
    });
  });
}
