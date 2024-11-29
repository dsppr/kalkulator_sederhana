import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/calculator_view_model.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String formatNumber(String number) {
    final formatter = NumberFormat.decimalPattern();
    return formatter.format(double.tryParse(number) ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CalculatorViewModel>(context);
    final isDarkMode = viewModel.isDarkMode;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkMode
                  ? [Colors.black87, Colors.black]
                  : [Colors.blue.shade100, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              // Header: Toggle Theme dan Reset
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: viewModel.toggleTheme,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.grey.shade800
                              : Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.light_mode,
                              color: isDarkMode ? Colors.grey : Colors.black,
                            ),
                            Icon(
                              Icons.dark_mode,
                              color: isDarkMode ? Colors.white : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: viewModel.clear,
                    ),
                  ],
                ),
              ),
              // Tampilan Expression dan Result
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    viewModel.expression.isNotEmpty
                        ? viewModel.expression
                        : '0',
                    style: TextStyle(
                      fontSize: 24,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    viewModel.result.isNaN
                        ? "Error"
                        : formatNumber(viewModel.result.toString()),
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              // Grid Tombol Kalkulator
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 20), // Tambahkan padding bawah
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      final buttons = [
                        'AC',
                        '+/-',
                        '%',
                        '/',
                        '7',
                        '8',
                        '9',
                        '*',
                        '4',
                        '5',
                        '6',
                        '-',
                        '1',
                        '2',
                        '3',
                        '+',
                        '0',
                        '00',
                        '.',
                        '='
                      ];
                      final buttonText = buttons[index];

                      Color buttonColor;
                      if (buttonText == 'AC' ||
                          buttonText == '+/-' ||
                          buttonText == '%') {
                        buttonColor = isDarkMode
                            ? Colors.blue.shade700
                            : Colors.blue.shade300;
                      } else if ('*/-+=.'.contains(buttonText)) {
                        buttonColor = isDarkMode
                            ? Colors.orange.shade700
                            : Colors.orange.shade400;
                      } else {
                        buttonColor =
                            isDarkMode ? Colors.grey.shade800 : Colors.white;
                      }

                      return GestureDetector(
                        onTap: () {
                          if (buttonText == 'AC') {
                            viewModel.clear();
                          } else if (buttonText == '=') {
                            viewModel.calculate();
                          } else {
                            viewModel.addInput(buttonText);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: buttonColor,
                            shape: BoxShape.circle, // Membuat tombol bundar
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(2, 2),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              buttonText,
                              style: TextStyle(
                                fontSize: 20,
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
