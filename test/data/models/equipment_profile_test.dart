import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/equipment_profile.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/aperture_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/iso_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/nd_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/shutter_speed_value.dart';

void main() {
  const a = EquipmentProfile(
    id: "0",
    name: "TestData0",
    apertureValues: ApertureValue.values,
    ndValues: NdValue.values,
    shutterSpeedValues: ShutterSpeedValue.values,
    isoValues: IsoValue.values,
  );
  const b = EquipmentProfile(
    id: "0",
    name: "TestData0",
    apertureValues: ApertureValue.values,
    ndValues: NdValue.values,
    shutterSpeedValues: ShutterSpeedValue.values,
    isoValues: IsoValue.values,
  );
  final c = EquipmentProfile(
    id: "1",
    name: "TestData1",
    apertureValues: ApertureValue.values.sublist(3, ApertureValue.values.length - 5),
    ndValues: [
      NdValue.values[0],
      NdValue.values[1],
      NdValue.values[2],
      NdValue.values.last,
    ],
    shutterSpeedValues: ShutterSpeedValue.values.sublist(3, ShutterSpeedValue.values.length - 5),
    isoValues: [
      IsoValue.values[1],
      IsoValue.values[5],
      IsoValue.values[10],
      IsoValue.values[12],
    ],
  );
  const d = EquipmentProfile(
    id: "1",
    name: "TestData1",
    apertureValues: ApertureValue.values,
    ndValues: NdValue.values,
    shutterSpeedValues: ShutterSpeedValue.values,
    isoValues: IsoValue.values,
  );

  test('==', () {
    expect(a == b && b == a, true);
    expect(a != c && c != a, true);
    expect(b != c && c != b, true);
    expect(d != c && c != d, true);
  });

  test('hashCode', () {
    expect(a.hashCode == b.hashCode, true);
    expect(a.hashCode != c.hashCode, true);
    expect(b.hashCode != c.hashCode, true);
  });

  test('copyWith', () {
    expect(
      a.copyWith(name: "TestData0_copy"),
      const EquipmentProfile(
        id: "0",
        name: "TestData0_copy",
        apertureValues: ApertureValue.values,
        ndValues: NdValue.values,
        shutterSpeedValues: ShutterSpeedValue.values,
        isoValues: IsoValue.values,
      ),
    );
    expect(
      c.copyWith(
        apertureValues: ApertureValue.values,
        ndValues: NdValue.values,
        shutterSpeedValues: ShutterSpeedValue.values,
        isoValues: IsoValue.values,
      ),
      const EquipmentProfile(
        id: "1",
        name: "TestData1",
        apertureValues: ApertureValue.values,
        ndValues: NdValue.values,
        shutterSpeedValues: ShutterSpeedValue.values,
        isoValues: IsoValue.values,
      ),
    );
  });
}
