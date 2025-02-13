import 'package:flutter/material.dart';
import 'package:quant/components/quant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(
                  "Bienvenido",
                  style: TextStyle(
                    fontSize: 32,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(child: Quant()),
              SizedBox(height: 60),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        key: Key("addIncomeButton"),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(colorScheme.primary),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/incomes/create');
                        },
                        child: Text(
                          "Añadir ingreso",
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        key: Key("addExpenseButton"),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(colorScheme.primary),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/expenses/create');
                        },
                        child: Text(
                          "Añadir gasto",
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}