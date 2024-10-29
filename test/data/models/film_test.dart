import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/film.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/photography_value.dart';
import 'package:m3_lightmeter_resources/src/data/models/photography_values/shutter_speed_value.dart';

void main() {
  const a = FilmExponential(id: '1', name: 'Film 1', iso: 100, exponent: 1);
  const b = FilmExponential(id: '1', name: 'Film 1', iso: 100, exponent: 1);
  const c = FilmExponential(id: '1', name: 'Film 2', iso: 100, exponent: 1);

  test('iso', () {
    expect(const FilmStub().iso, 0);
  });

  test('==', () {
    expect(const FilmStub() == Film.values[0], true);
    expect(a == b, true);
    expect(a == const FilmStub(), false);
    expect(a == c, false);
  });

  test('hashCode', () {
    expect(const FilmStub().hashCode == Film.values[0].hashCode, true);
    expect(a.hashCode == b.hashCode, true);
    expect(a.hashCode == const FilmStub().hashCode, false);
    expect(a.hashCode == c.hashCode, false);
  });

  group(
    'reciprocityFailure',
    () {
      test(
        'FilmStub()',
        () {
          expect(
            const FilmStub().reciprocityFailure(const ShutterSpeedValue(1000, true, StopType.full)),
            const ShutterSpeedValue(1000, true, StopType.full),
          );
          expect(
            const FilmStub().reciprocityFailure(const ShutterSpeedValue(1, false, StopType.full)),
            const ShutterSpeedValue(1, false, StopType.full),
          );
          expect(
            const FilmStub().reciprocityFailure(const ShutterSpeedValue(16, false, StopType.full)),
            const ShutterSpeedValue(16, false, StopType.full),
          );
        },
      );

      test(
        'has formula',
        () {
          const film = FilmExponential(id: '1', name: 'Film 1', iso: 100, exponent: 2);
          expect(
            film.reciprocityFailure(const ShutterSpeedValue(1000, true, StopType.full)),
            const ShutterSpeedValue(1000, true, StopType.full),
          );
          expect(
            film.reciprocityFailure(const ShutterSpeedValue(1, false, StopType.full)),
            const ShutterSpeedValue(1, false, StopType.full),
          );
          expect(
            film.reciprocityFailure(const ShutterSpeedValue(16, false, StopType.full)),
            const ShutterSpeedValue(256, false, StopType.full),
          );
        },
      );
    },
  );

  group('copyWith', () {
    test(
      'FilmExponential',
      () {
        const a = FilmExponential(
          id: '1',
          name: 'FilmExponential 1',
          iso: 100,
          exponent: 1,
        );
        expect(
          a.copyWith(name: "FilmExponential 1 copy"),
          const FilmExponential(
            id: '1',
            name: "FilmExponential 1 copy",
            iso: 100,
            exponent: 1,
          ),
        );
        expect(
          a.copyWith(iso: 200),
          const FilmExponential(
            id: '1',
            name: "FilmExponential 1",
            iso: 200,
            exponent: 1,
          ),
        );
        expect(
          a.copyWith(exponent: 2),
          const FilmExponential(
            id: '1',
            name: "FilmExponential 1",
            iso: 100,
            exponent: 2,
          ),
        );
      },
    );

    test(
      'FilmPolynomian',
      () {
        const a = FilmPolynomian(
          id: '1',
          name: 'FilmPolynomian 1',
          iso: 100,
          a: 1,
          b: 2,
          c: 3,
        );
        expect(
          a.copyWith(name: "FilmPolynomian 1 copy"),
          const FilmPolynomian(
            id: '1',
            name: "FilmPolynomian 1 copy",
            iso: 100,
            a: 1,
            b: 2,
            c: 3,
          ),
        );
        expect(
          a.copyWith(iso: 200),
          const FilmPolynomian(
            id: '1',
            name: "FilmPolynomian 1",
            iso: 200,
            a: 1,
            b: 2,
            c: 3,
          ),
        );
        expect(
          a.copyWith(a: 10),
          const FilmPolynomian(
            id: '1',
            name: "FilmPolynomian 1",
            iso: 100,
            a: 10,
            b: 2,
            c: 3,
          ),
        );
        expect(
          a.copyWith(b: 10),
          const FilmPolynomian(
            id: '1',
            name: "FilmPolynomian 1",
            iso: 100,
            a: 1,
            b: 10,
            c: 3,
          ),
        );
        expect(
          a.copyWith(c: 10),
          const FilmPolynomian(
            id: '1',
            name: "FilmPolynomian 1",
            iso: 100,
            a: 1,
            b: 2,
            c: 10,
          ),
        );
      },
    );
  });
}
