import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/m3_lightmeter_resources.dart';

void main() {
  // Stringify
  test('Stringify aperture values', () {
    expect(ApertureValue.values.first.toString(), "f/1.0");
    expect(ApertureValue.values.last.toString(), "f/45");
  });

  test('Stringify iso values', () {
    expect(IsoValue.values.first.toString(), "3");
    expect(IsoValue.values.last.toString(), "6400");
  });

  test('Stringify shutter speed values', () {
    expect(ShutterSpeedValue.values.first.toString(), "1/2000");
    expect(ShutterSpeedValue.values.last.toString(), "16\"");
  });

  // Stops
  test('Aperture values stops lists', () {
    expect(ApertureValue.values.fullStops().length, 12);
    expect(ApertureValue.values.halfStops().length, 12 + 11);
    expect(ApertureValue.values.thirdStops().length, 12 + 22);
  });

  test('Iso values stops lists', () {
    expect(IsoValue.values.fullStops().length, 12);
    expect(IsoValue.values.thirdStops().length, 12 + 22);
  });

  test('Shutter speed values stops lists', () {
    expect(ShutterSpeedValue.values.fullStops().length, 16);
    expect(ShutterSpeedValue.values.halfStops().length, 16 + 15);
    expect(ShutterSpeedValue.values.thirdStops().length, 16 + 30);
  });
}
