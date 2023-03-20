import 'photography_values/aperture_value.dart';
import 'photography_values/iso_value.dart';
import 'photography_values/nd_value.dart';
import 'photography_values/shutter_speed_value.dart';

class EquipmentProfileData {
  final String id;
  final String name;
  final List<ApertureValue> apertureValues;
  final List<NdValue> ndValues;
  final List<ShutterSpeedValue> shutterSpeedValues;
  final List<IsoValue> isoValues;

  const EquipmentProfileData({
    required this.id,
    required this.name,
    required this.apertureValues,
    required this.ndValues,
    required this.shutterSpeedValues,
    required this.isoValues,
  });

  EquipmentProfileData copyWith({
    String? name,
    List<ApertureValue>? apertureValues,
    List<NdValue>? ndValues,
    List<ShutterSpeedValue>? shutterSpeedValues,
    List<IsoValue>? isoValues,
  }) =>
      EquipmentProfileData(
        id: id,
        name: name ?? this.name,
        apertureValues: apertureValues ?? this.apertureValues,
        ndValues: ndValues ?? this.ndValues,
        shutterSpeedValues: shutterSpeedValues ?? this.shutterSpeedValues,
        isoValues: isoValues ?? this.isoValues,
      );
}
