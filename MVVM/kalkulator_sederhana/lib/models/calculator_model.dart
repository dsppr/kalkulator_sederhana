import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorModel extends ChangeNotifier {
  double _result = 0;
  String _expression = "";
  bool _isDarkMode = false;
  bool _useResult = false; // Flag untuk melanjutkan dari hasil sebelumnya

  double get result => _result;
  String get expression => _expression;
  bool get isDarkMode => _isDarkMode;

  set expression(String value) {
    _expression = value;
    notifyListeners();
  }

  void addNumber(String number) {
    if (_useResult) {
      _expression = ""; // Reset jika menggunakan hasil sebelumnya
      _useResult = false;
    }
    _expression += number;
    notifyListeners();
  }

  void clear() {
    _expression = "";
    _result = 0;
    _useResult = false;
    notifyListeners();
  }

  void calculate() {
    try {
      _result = _evaluateExpression(_expression);
      _useResult = true; // Tandai bahwa hasil sekarang siap digunakan
      notifyListeners();
    } catch (e) {
      _result = double.nan;
      _useResult = false;
      notifyListeners();
    }
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  double _evaluateExpression(String expression) {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();
      return exp.evaluate(EvaluationType.REAL, contextModel);
    } catch (e) {
      return double.nan; // Jika terjadi kesalahan, kembalikan NaN
    }
  }
}
