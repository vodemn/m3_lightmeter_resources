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

    test('Stop-type-based rounding for 1-10s range', () {
      // Full stop rounding (nearest whole number)
      expect(
        const ShutterSpeedValue(1.4, false, StopType.full).toString(),
        "1s",
        reason: "1.4s with full stop rounds down to 1s",
      );
      expect(
        const ShutterSpeedValue(1.6, false, StopType.full).toString(),
        "2s",
        reason: "1.6s with full stop rounds up to 2s",
      );
      expect(
        const ShutterSpeedValue(4.4, false, StopType.full).toString(),
        "4s",
        reason: "4.4s with full stop rounds down to 4s",
      );
      expect(
        const ShutterSpeedValue(4.6, false, StopType.full).toString(),
        "5s",
        reason: "4.6s with full stop rounds up to 5s",
      );

      // Half stop rounding (nearest 0.5 increment)
      expect(
        const ShutterSpeedValue(1.2, false, StopType.half).toString(),
        "1s",
        reason: "1.2s with half stop rounds down to 1s",
      );
      expect(
        const ShutterSpeedValue(1.3, false, StopType.half).toString(),
        "1.5s",
        reason: "1.3s with half stop rounds up to 1.5s",
      );
      expect(
        const ShutterSpeedValue(1.7, false, StopType.half).toString(),
        "1.5s",
        reason: "1.7s with half stop rounds down to 1.5s",
      );
      expect(
        const ShutterSpeedValue(1.8, false, StopType.half).toString(),
        "2s",
        reason: "1.8s with half stop rounds up to 2s",
      );
      expect(
        const ShutterSpeedValue(2.3, false, StopType.half).toString(),
        "2.5s",
        reason: "2.3s with half stop rounds up to 2.5s",
      );
      expect(
        const ShutterSpeedValue(2.7, false, StopType.half).toString(),
        "2.5s",
        reason: "2.7s with half stop rounds down to 2.5s",
      );

      // Third stop rounding (0.3 for <0.5, 0.6 for >=0.5)
      expect(
        const ShutterSpeedValue(1.2, false, StopType.third).toString(),
        "1.3s",
        reason: "1.2s with third stop rounds to 1.3s (<0.5)",
      );
      expect(
        const ShutterSpeedValue(1.5, false, StopType.third).toString(),
        "1.6s",
        reason: "1.5s with third stop rounds to 1.6s (>=0.5)",
      );
      expect(
        const ShutterSpeedValue(2.2, false, StopType.third).toString(),
        "2.3s",
        reason: "2.2s with third stop rounds to 2.3s (<0.5)",
      );
      expect(
        const ShutterSpeedValue(2.5, false, StopType.third).toString(),
        "2.6s",
        reason: "2.5s with third stop rounds to 2.6s (>=0.5)",
      );
      expect(
        const ShutterSpeedValue(3.2, false, StopType.third).toString(),
        "3.3s",
        reason: "3.2s with third stop rounds to 3.3s (<0.5)",
      );
      expect(
        const ShutterSpeedValue(3.5, false, StopType.third).toString(),
        "3.6s",
        reason: "3.5s with third stop rounds to 3.6s (>=0.5)",
      );
    });

    test('Boundary values for 1-10s range', () {
      // Test exact boundary values
      expect(
        const ShutterSpeedValue(1.0, false, StopType.full).toString(),
        "1s",
        reason: "Exactly 1s should remain 1s",
      );
      expect(
        const ShutterSpeedValue(10.0, false, StopType.full).toString(),
        "10s",
        reason: "Exactly 10s should remain 10s",
      );

      // Test rounding at 0.5 boundary for third stop
      expect(
        const ShutterSpeedValue(1.49, false, StopType.third).toString(),
        "1.3s",
        reason: "1.49s with third stop rounds down to 1.3s (<0.5)",
      );
      expect(
        const ShutterSpeedValue(1.51, false, StopType.third).toString(),
        "1.6s",
        reason: "1.51s with third stop rounds up to 1.6s (>=0.5)",
      );

      // Test values just below 10s
      expect(
        const ShutterSpeedValue(9.9, false, StopType.full).toString(),
        "10s",
        reason: "9.9s with full stop should round to 10s",
      );
    });
  });
}
