import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quant/domain/expense.dart';
import 'package:quant/domain/income.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuantityStateProvider extends ChangeNotifier {
  double _quantity = 0.0; // Initialize _quantity
  List<Income> _incomes = List<Income>.empty(growable: true);
  List<Expense> _expenses = List<Expense>.empty(growable: true);

  QuantityStateProvider({double quantity = 0.0}) {
    _restoreState();
  }

  double get quantity => _quantity;

  List<Income> get incomes => _incomes;
  List<Expense> get expenses => _expenses;

  /// Adds the quantity of the [income] to the total quantity and saves the [income] in the list of incomes
  void addIncome(Income income) {
    _quantity += income.quantity;
    _incomes.add(income);
    notifyListeners();
    _saveState();
  }

  /// Subtracts the quantity of the [expense] to the total quantity and saves the [expense] in the list of expenses
  void addExpense(Expense expense) {
    if (expense.quantity > _quantity) {
      throw Exception("No hay suficiente dinero para realizar el gasto");
    }
    _quantity -= expense.quantity;
    _expenses.add(expense);
    notifyListeners();
    _saveState();
  }

  String quantityAsString() {
    String quantityStr = _quantity.toStringAsFixed(2);
    if (quantityStr.length > 10) {
      quantityStr = quantityStr.substring(0, 10);
    }
    return quantityStr;
  }

  void _saveState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('quantity', _quantity);
    String incomesStr = json.encode(_incomes.map((e) => e.toJson()).toList());
    await prefs.setString('incomes', incomesStr);
    String expensesStr = json.encode(_expenses.map((e) => e.toJson()).toList());
    await prefs.setString('expenses', expensesStr);
  }

  void _restoreState() async {
    final prefs = await SharedPreferences.getInstance();
    _quantity = prefs.getDouble('quantity') ?? 0.0;
    String? incomesStr = prefs.getString('incomes');
    print(incomesStr);
    if (incomesStr != null) {
      _incomes = (json.decode(incomesStr) as List)
          .map((e) => Income.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    String? expensesStr = prefs.getString('expenses');
    print(expensesStr);
    if (expensesStr != null) {
      _expenses = (json.decode(expensesStr) as List)
          .map((e) => Expense.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    notifyListeners(); // Notify listeners after restoring state
  }
}
