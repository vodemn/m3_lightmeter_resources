import 'photography_value.dart';

class ShutterSpeedValue extends PhotographyStopValue<double> {
  final bool isFraction;

  const ShutterSpeedValue(super.rawValue, this.isFraction, super.stopType);

  @override
  double get value => isFraction ? 1 / rawValue : rawValue;

  @override
  String toString() {
    String toStringAsFixed(double value) {
      if (value - value.floor() == 0) {
        return value.toInt().toString();
      } else {
        return value.toStringAsFixed(1);
      }
    }

    final buffer = StringBuffer();
    double rawValue = this.rawValue;
    if (isFraction) {
      buffer.writeAll(["1/", toStringAsFixed(rawValue)]);
    } else {
      // longer than 1 hours
      if (rawValue >= 3600) {
        final hours = rawValue ~/ 3600;
        buffer.writeAll([hours, '°']);
        rawValue -= hours * 3600;
      }
      // longer than 1 minute
      if (rawValue >= 60 || rawValue == 0) {
        final minutes = rawValue ~/ 60;
        buffer.writeAll([rawValue ~/ 60, "'"]);
        rawValue -= minutes * 60;
      }
      // longer than 1 second
      buffer.writeAll([toStringAsFixed(rawValue), '"']);
    }
    return buffer.toString();
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
