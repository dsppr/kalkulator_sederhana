import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_sederhana/models/calculator_model.dart';

void main() {
  late CalculatorModel calculator;

  setUp(() {
    calculator = CalculatorModel();
  });

  test('Menambah angka ke ekspresi', () {
    calculator.addNumber("5");
    expect(calculator.expression, "5");
  });

  test('Menghapus ekspresi dengan clear()', () {
    calculator.addNumber("5");
    calculator.clear();
    expect(calculator.expression, "");
    expect(calculator.result, 0);
  });

  test('Menghitung ekspresi sederhana', () {
    calculator.addNumber("10");
    calculator.calculate();
    expect(calculator.result, 10);
  });

  test('Menangani ekspresi tidak valid', () {
    calculator.addNumber("abc"); // Ekspresi tidak valid
    calculator.calculate();
    expect(calculator.result, isNaN);
  });
}
