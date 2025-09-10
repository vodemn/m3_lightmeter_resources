import 'photography_value.dart';

class ShutterSpeedValue extends PhotographyStopValue<double> {
  final bool isFraction;

  const ShutterSpeedValue(super.rawValue, this.isFraction, super.stopType)
      : assert(isFraction || rawValue >= 1, 'Non-fractional shutter speed value must be greater or equal to 1');

  @override
  double get value => isFraction ? 1 / rawValue : rawValue;

  @override
  String toString() {
    if (isFraction) {
      return "1/${_cleanDouble(rawValue)}";
    } else {
      final double seconds = rawValue;
      const int secondsPerMinute = 60;
      const int secondsPerHour = 3600;
      const int secondsPerDay = 86400;

      if (seconds < 1) {
        // <1s: show decimal seconds up to 0.1 precision
        final rounded = _roundTo(seconds, 0.1);
        return "${_cleanDouble(rounded)}s";
      } else if (seconds < 10) {
        // 1s–9.99s: round according to stop type
        final rounded = _roundToStopType(seconds, stopType);
        return "${_cleanDouble(rounded)}s";
      } else if (seconds < secondsPerMinute) {
        // 10s–59s: round to nearest 1s
        final rounded = _roundTo(seconds, 1).toInt();
        return "${rounded}s";
      } else if (seconds < secondsPerHour) {
        // 1m–59m: round to nearest 1s
        final rounded = _roundTo(seconds, 1).toInt();
        return _formatMinutesSeconds(rounded, secondsPerMinute);
      } else if (seconds < secondsPerDay) {
        // 1h–23h: round to nearest 1m
        final rounded = _roundTo(seconds, 60).toInt();
        return _formatHoursMinutes(rounded, secondsPerHour, secondsPerMinute);
      } else if (seconds < 30 * secondsPerDay) {
        // 1d–29d: round to nearest 1h
        final rounded = _roundTo(seconds, 3600).toInt();
        return _formatDaysHours(rounded, secondsPerDay, secondsPerHour);
      } else {
        // ≥30d: show "Dd" only
        final d = (seconds / secondsPerDay).round();
        return "${d}d";
      }
    }
  }

  // Helper methods for time formatting
  String _cleanDouble(double v) {
    if (v == v.roundToDouble()) {
      return v.toInt().toString();
    }
    return v.toStringAsFixed(1);
  }

  double _roundTo(double value, double precision) {
    return (value / precision).round() * precision;
  }

  double _roundToStopType(double value, StopType stopType) {
    switch (stopType) {
      case StopType.full:
        // Round to nearest whole number
        return value.roundToDouble();
      case StopType.half:
        // Round to nearest 0.5 increment
        return (value * 2).round() / 2;
      case StopType.third:
        // Round to nearest 1/3 increment, but round 0.5+ to 0.6
        final double base = value.floorToDouble();
        final double fractional = value - base;

        if (fractional < 0.5) {
          return base + 0.3;
        } else {
          return base + 0.6;
        }
    }
  }

  String _formatMinutesSeconds(int totalSeconds, int secondsPerMinute) {
    int m = totalSeconds ~/ secondsPerMinute;
    int s = totalSeconds % secondsPerMinute;
    return "${m}m ${s}s";
  }

  String _formatHoursMinutes(int totalSeconds, int secondsPerHour, int secondsPerMinute) {
    int h = totalSeconds ~/ secondsPerHour;
    int m = (totalSeconds % secondsPerHour) ~/ secondsPerMinute;
    return "${h}h ${m}m";
  }

  String _formatDaysHours(int totalSeconds, int secondsPerDay, int secondsPerHour) {
    int d = totalSeconds ~/ secondsPerDay;
    int h = (totalSeconds % secondsPerDay) ~/ secondsPerHour;
    return "${d}d ${h}h";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ShutterSpeedValue && other.rawValue == rawValue && other.isFraction == isFraction;
  }

  @override
  int get hashCode => Object.hash(rawValue, isFraction, runtimeType);

  static const List<ShutterSpeedValue> values = [
    ShutterSpeedValue(4000, true, StopType.full),
    ShutterSpeedValue(3200, true, StopType.third),
    ShutterSpeedValue(3000, true, StopType.half),
    ShutterSpeedValue(2500, true, StopType.third),
    ShutterSpeedValue(2000, true, StopType.full),
    ShutterSpeedValue(1600, true, StopType.third),
    ShutterSpeedValue(1500, true, StopType.half),
    ShutterSpeedValue(1250, true, StopType.third),
    ShutterSpeedValue(1000, true, StopType.full),
    ShutterSpeedValue(800, true, StopType.third),
    ShutterSpeedValue(750, true, StopType.half),
    ShutterSpeedValue(640, true, StopType.third),
    ShutterSpeedValue(500, true, StopType.full),
    ShutterSpeedValue(400, true, StopType.third),
    ShutterSpeedValue(350, true, StopType.half),
    ShutterSpeedValue(320, true, StopType.third),
    ShutterSpeedValue(250, true, StopType.full),
    ShutterSpeedValue(200, true, StopType.third),
    ShutterSpeedValue(180, true, StopType.half),
    ShutterSpeedValue(160, true, StopType.third),
    ShutterSpeedValue(125, true, StopType.full),
    ShutterSpeedValue(100, true, StopType.third),
    ShutterSpeedValue(90, true, StopType.half),
    ShutterSpeedValue(80, true, StopType.third),
    ShutterSpeedValue(60, true, StopType.full),
    ShutterSpeedValue(50, true, StopType.third),
    ShutterSpeedValue(45, true, StopType.half),
    ShutterSpeedValue(40, true, StopType.third),
    ShutterSpeedValue(30, true, StopType.full),
    ShutterSpeedValue(25, true, StopType.third),
    ShutterSpeedValue(20, true, StopType.half),
    ShutterSpeedValue(20, true, StopType.third),
    ShutterSpeedValue(15, true, StopType.full),
    ShutterSpeedValue(13, true, StopType.third),
    ShutterSpeedValue(10, true, StopType.half),
    ShutterSpeedValue(10, true, StopType.third),
    ShutterSpeedValue(8, true, StopType.full),
    ShutterSpeedValue(6, true, StopType.third),
    ShutterSpeedValue(6, true, StopType.half),
    ShutterSpeedValue(5, true, StopType.third),
    ShutterSpeedValue(4, true, StopType.full),
    ShutterSpeedValue(3, true, StopType.third),
    ShutterSpeedValue(3, true, StopType.half),
    ShutterSpeedValue(2.5, true, StopType.third),
    ShutterSpeedValue(2, true, StopType.full),
    ShutterSpeedValue(1.6, true, StopType.third),
    ShutterSpeedValue(1.5, true, StopType.half),
    ShutterSpeedValue(1.3, true, StopType.third),
    ShutterSpeedValue(1, false, StopType.full),
  ];
}
