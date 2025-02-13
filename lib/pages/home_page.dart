import 'package:flutter/material.dart';
import 'package:quant/components/quant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
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
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
              SizedBox(height: 60),
              Quant(),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      key: Key("addIncomeButton"),
                      onPressed: (){
                          Navigator.pushNamed(context, '/incomes/create');
                      },
                      child: const Text(
                        "Añadir ingreso"
                      ),
                    ),
                    ElevatedButton(
                      key: Key("addExpenseButton"),
                      onPressed: (){
                          Navigator.pushNamed(context, '/expenses/create');
                      },
                      child: const Text(
                        "Añadir gasto"
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