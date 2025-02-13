import 'package:flutter/material.dart';
import 'package:quant/pages/create_expense_page.dart';
import 'package:quant/pages/create_income_page.dart';
import 'package:quant/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0x1A2E35FF),
          primary:  Color(0x1A2E35FF),
          onPrimary: Color(0xD8E1E0FF),
          secondary: Color(0x3B4347FF),
          onSecondary: Color(0xFCFCFDFF)
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        // Incomes
        '/incomes/create': (context) => CreateIncomePage(),
        // Expenses
        '/expenses/create': (context) => CreateExpensePage(),
      },
    );
  }
}
