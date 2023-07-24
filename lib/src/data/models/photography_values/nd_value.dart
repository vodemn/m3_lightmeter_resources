import 'package:m3_lightmeter_resources/src/utils/log_2.dart';

import 'photography_value.dart';

class NdValue extends PhotographyValue<int> {
  const NdValue(super.rawValue);

  double get stopReduction => value == 0 ? 0.0 : log2(value);

  @override
  double difference(PhotographyValue other) {
    if (value == other.value) {
      return 0.0;
    } else {
      final absValue = (log2((other.value - value).abs()) * 10).roundToDouble() / 10;
      if (other.value < value) {
        return -absValue;
      } else {
        return absValue;
      }
    }
  }

  @override
  String toString() => 'ND$value';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is NdValue && other.rawValue == rawValue;
  }

  @override
  int get hashCode => Object.hash(rawValue, runtimeType);

  /// https://shuttermuse.com/neutral-density-filter-numbers-names/
  static const List<NdValue> values = [
    NdValue(0),
    NdValue(2),
    NdValue(4),
    NdValue(8),
    NdValue(16),
    NdValue(32),
    NdValue(64),
    NdValue(100),
    NdValue(128),
    NdValue(256),
    NdValue(400),
    NdValue(512),
    NdValue(1024),
    NdValue(2048),
    NdValue(4096),
    NdValue(6310),
    NdValue(8192),
    NdValue(10000),
  ];
}
