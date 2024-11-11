import 'package:m3_lightmeter_resources/src/utils/identifiable.dart';

typedef Togglable<T extends Identifiable> = ({T value, bool isUsed});

typedef TogglableMap<T extends Identifiable> = Map<String, Togglable<T>>;

extension TogglableMapper on List {
  TogglableMap<T> toTogglableMap<T extends Identifiable>({bool isUsed = true}) {
    return Map.fromEntries(
      map(
        (e) => MapEntry(
          e.id,
          (
            value: e as T,
            isUsed: isUsed,
          ),
        ),
      ),
    );
  }
}
