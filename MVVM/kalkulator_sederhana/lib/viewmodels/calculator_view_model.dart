import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorViewModel extends ChangeNotifier {
  String _expression = ''; // Menyimpan input user
  double _result = 0.0; // Hasil kalkulasi
  bool _isDarkMode = false;
  bool _hasCalculated = false; // Penanda apakah "=" telah ditekan

  String get expression => _expression;
  double get result => _result;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void addInput(String input) {
    // Jika sebelumnya sudah selesai kalkulasi, reset untuk melanjutkan dari hasil
    if (_hasCalculated && !_isOperator(input)) {
      _expression = '';
      _hasCalculated = false;
    }

    if (_hasCalculated && _isOperator(input)) {
      // Jika melanjutkan dari hasil sebelumnya dengan operator
      _expression = _result.toString() + input;
      _hasCalculated = false;
    } else {
      _expression += input;
    }

    notifyListeners();
  }

  void calculate() {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(_expression);
      ContextModel contextModel = ContextModel();
      _result = exp.evaluate(EvaluationType.REAL, contextModel);
      _hasCalculated = true; // Set bahwa hasil telah dihitung
    } catch (e) {
      _result = double.nan; // Jika error, set hasil menjadi "Error"
    }
    notifyListeners();
  }

  void clear() {
    _expression = '';
    _result = 0.0;
    _hasCalculated = false;
    notifyListeners();
  }

  bool _isOperator(String input) {
    return ['+', '-', '*', '/', '%'].contains(input);
  }
}
