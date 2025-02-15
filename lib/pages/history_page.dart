import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quant/components/expense_card.dart';
import 'package:quant/components/income_card.dart';
import 'package:quant/state/quantity_state_provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ingresos",
              style: TextStyle(
                fontSize: 32,
                color: colorScheme.onSurface,
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: context
                    .watch<QuantityStateProvider>()
                    .incomes
                    .map((income) {
                  return IncomeCard(
                      quantity: income.quantity.toStringAsFixed(2),
                      description: income.description);
                }).toList(),
              ),
            ),
            Text(
              "Gastos",
              style: TextStyle(
                fontSize: 32,
                color: colorScheme.onSurface,
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: context
                    .watch<QuantityStateProvider>()
                    .expenses
                    .map((expense) {
                  return ExpenseCard(
                      quantity: expense.quantity.toStringAsFixed(2),
                      category: expense.category,
                      description: expense.description);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
