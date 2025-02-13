import 'package:flutter/material.dart';
import 'package:quant/domain/expense.dart';
import 'package:quant/domain/income.dart';

class QuantityStateProvider extends ChangeNotifier{
  late double _quantity;
  late List<Income> _incomes;
  late List<Expense> _expenses;

  QuantityStateProvider({double quantity = 0.0}){
    _quantity = quantity;
    _incomes = List<Income>.empty(growable: true);
    _expenses = List<Expense>.empty(growable: true);
  }
  
  double get quantity => _quantity;
  
  List<Income> get incomes => _incomes;
  List<Expense> get expenses => _expenses;
  
  /// Adds the quantity of the [income] to the total quantity and saves the [income] in the list of incomes
  void addIncome(Income income) {
    _quantity += income.quantity;
    _incomes.add(income);
    notifyListeners();
  }
  
  /// Substracts the quantity of the [expense] to the total quantity and saves the [expense] in the list of expenses 
  void addExpense(Expense expense) {
    if(expense.quantity > _quantity){
      throw Exception("No hay suficiente dinero para realizar el gasto");
    }
    _quantity -= expense.quantity;
    _expenses.add(expense);
    notifyListeners();
  }

  String quantityAsString() {
    String quantityStr = _quantity.toStringAsFixed(2);
    if (quantityStr.length > 10) {
      quantityStr = quantityStr.substring(0, 10);
    }
    return quantityStr;
  }
}