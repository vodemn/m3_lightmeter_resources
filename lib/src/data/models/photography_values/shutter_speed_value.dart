import 'photography_value.dart';

class ShutterSpeedValue extends PhotographyStopValue<double> {
  final bool isFraction;

  const ShutterSpeedValue(super.rawValue, this.isFraction, super.stopType);

  @override
  double get value => isFraction ? 1 / rawValue : rawValue;

  @override
  String toString() {
    String cleanDouble(double v) {
      if (v == v.roundToDouble()) {
        return v.toInt().toString();
      }
      return v.toStringAsFixed(1);
    }

    if (isFraction) {
      return "1/${cleanDouble(rawValue)}";
    } else {
      double seconds = rawValue;
      const int secondsPerMinute = 60;
      const int secondsPerHour = 3600;
      const int secondsPerDay = 86400;

      // Rounding helpers
      double roundTo(double value, double precision) {
        return (value / precision).round() * precision;
      }

      if (seconds < 1) {
        // <1s: show fraction or decimal seconds up to 0.1 precision.
        double rounded = roundTo(seconds, 0.1);
        return "${cleanDouble(rounded)}s";
      } else if (seconds < 10) {
        // <10s → one decimal
        double rounded = roundTo(seconds, 0.1);
        return "${cleanDouble(rounded)}s";
      } else if (seconds < secondsPerMinute) {
        // 10s–59s: nearest 1s
        int rounded = roundTo(seconds, 1).toInt();
        return "${rounded}s";
      } else if (seconds < 10 * secondsPerMinute) {
        // 1m–10m → nearest 1s
        int rounded = roundTo(seconds, 1).toInt();
        int m = rounded ~/ secondsPerMinute;
        int s = rounded % secondsPerMinute;
        return "$m:${s.toString().padLeft(2, '0')}";
      } else if (seconds < secondsPerHour) {
        // 10m–1h → nearest 10s
        int rounded = roundTo(seconds, 10).toInt();
        int m = rounded ~/ secondsPerMinute;
        int s = rounded % secondsPerMinute;
        return "$m:${s.toString().padLeft(2, '0')}";
      } else if (seconds < 6 * secondsPerHour) {
        // 1h–6h → nearest 1m
        int rounded = roundTo(seconds, 60).toInt();
        int h = rounded ~/ secondsPerHour;
        int m = (rounded % secondsPerHour) ~/ secondsPerMinute;
        return "${h}h ${m}m";
      } else if (seconds < secondsPerDay) {
        // 6h–1d → nearest 5m
        int rounded = roundTo(seconds, 300).toInt(); // 5*60=300
        int h = rounded ~/ secondsPerHour;
        int m = (rounded % secondsPerHour) ~/ secondsPerMinute;
        return "${h}h ${m}m";
      } else if (seconds < 7 * secondsPerDay) {
        // 1d–7d → nearest 10m
        int rounded = roundTo(seconds, 600).toInt(); // 10*60=600
        int d = rounded ~/ secondsPerDay;
        int h = (rounded % secondsPerDay) ~/ secondsPerHour;
        return "${d}d ${h}h";
      } else if (seconds < 31 * secondsPerDay) {
        // 7d–31d → nearest 1h
        int rounded = roundTo(seconds, 3600).toInt();
        int d = rounded ~/ secondsPerDay;
        int h = (rounded % secondsPerDay) ~/ secondsPerHour;
        return "${d}d ${h}h";
      } else {
        // ≥30d: show "Dd" only.
        int d = (seconds / secondsPerDay).round();
        return "${d}d";
      }
    }
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
