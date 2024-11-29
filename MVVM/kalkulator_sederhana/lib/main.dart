import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/calculator_view_model.dart';
import 'views/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalculatorViewModel(), // Langsung gunakan ViewModel
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Sesuaikan dengan tema sistem
      home:
          const HomeScreen(), // Pastikan HomeScreen tidak memerlukan parameter
    );
  }
}
