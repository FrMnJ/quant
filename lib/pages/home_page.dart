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
              _buildWelcomeText(colorScheme),
              const SizedBox(height: 50),
              Center(child: Quant()),
              const SizedBox(height: 60),
              _buildActionButtons(context, colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Text(
        "Bienvenido",
        style: TextStyle(
          fontSize: 32,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, ColorScheme colorScheme) {
    return Center(
      child: Column(
        children: [
          _buildButton(
            context,
            colorScheme,
            "Añadir ingreso",
            Key("addIncomeButton"),
            '/incomes/create',
          ),
          const SizedBox(height: 20),
          _buildButton(
            context,
            colorScheme,
            "Añadir gasto",
            Key("addExpenseButton"),
            '/expenses/create',
          ),
          _buildButton(context,
            colorScheme,
            "Ver historial",
            Key("viewHistoryButton"),
           '/history'),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    ColorScheme colorScheme,
    String text,
    Key key,
    String route,
  ) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        key: key,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colorScheme.primary),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          text,
          style: TextStyle(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}