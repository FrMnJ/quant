import 'package:flutter/material.dart';
import 'package:quant/pages/create_expense_page.dart';
import 'package:quant/pages/create_income_page.dart';
import 'package:quant/pages/home_page.dart';
import 'package:quant/theme/colors.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.surface,
          onPrimary: AppColors.onSurface,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: AppColors.background,
          onSurface: AppColors.onBackground,
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
