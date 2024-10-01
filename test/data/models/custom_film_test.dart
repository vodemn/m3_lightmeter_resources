import 'package:flutter_test/flutter_test.dart';
import 'package:m3_lightmeter_resources/src/data/models/film.dart';

double _reciprocity1(double t) => t * 1;
double _reciprocity2(double t) => t * 2;

void main() {
  const a = CustomFilm(
    id: '1',
    name: 'CustomFilm 1',
    iso: 100,
    reciprocityFormula: _reciprocity1,
  );
  const b = CustomFilm(
    id: '1',
    name: 'CustomFilm 1',
    iso: 100,
    reciprocityFormula: _reciprocity1,
  );
  const c = CustomFilm(
    id: '2',
    name: 'CustomFilm 2',
    iso: 100,
    reciprocityFormula: _reciprocity2,
  );
  const d = CustomFilm(
    id: '3',
    name: 'CustomFilm 3',
    iso: 400,
    reciprocityFormula: _reciprocity2,
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
      a.copyWith(name: "CustomFilm 1 copy"),
      const CustomFilm(
        id: "1",
        name: "CustomFilm 1 copy",
        iso: 100,
        reciprocityFormula: _reciprocity1,
      ),
    );
    expect(
      a.copyWith(iso: 200),
      const CustomFilm(
        id: "1",
        name: "CustomFilm 1",
        iso: 200,
        reciprocityFormula: _reciprocity1,
      ),
    );
    expect(
      a.copyWith(reciprocityFormula: _reciprocity2),
      const CustomFilm(
        id: "1",
        name: "CustomFilm 1",
        iso: 100,
        reciprocityFormula: _reciprocity2,
      ),
    );
  });
}
