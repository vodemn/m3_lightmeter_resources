import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/utils/optional.dart';

void main() {
  const noValue = Optional<int>(null);
  const a = Optional<int>(1);
  const b = Optional<int>(1);
  const c = Optional<int>(2);

  test('==', () {
    expect(a == b, true);
    expect(a == noValue, false);
    expect(a == c, false);
    expect(noValue == const Optional<int>(null), true);
  });
}
