
import 'package:flutter_test/flutter_test.dart';
import 'package:quant/domain/expense.dart';
import 'package:quant/domain/income.dart';
import 'package:quant/state/app_state_provider.dart';

void main(){
  group("AppStateProvider", (){
    late AppStateProvider appStateProvider;
    setUp((){
      appStateProvider = AppStateProvider();
    });
    
    test("should return the initial state", (){
        expect(appStateProvider.quantity, 0.0);
        expect(appStateProvider.incomes.length, 0);
        expect(appStateProvider.expenses.length, 0);
    });

    test("should add to quantity when adding income", (){
      final Income income = Income(500.0, "Salario minimo");
      bool notifiedListener = false;
      appStateProvider.addListener((){
        notifiedListener = true;
      });
      appStateProvider.addIncome(income);
      expect(notifiedListener, true);
      expect(appStateProvider.quantity, 500.0);
      expect(appStateProvider.incomes.length, 1);
    });

    test("should substract to quantity when adding expense", (){
      final Income income = Income(500.0, "Salario minimo");
      appStateProvider.addIncome(income);
      final Expense expense = Expense(300.0, "Comida", "Cena con amigos");
      bool notifiedListener = false;
      appStateProvider.addListener((){
        notifiedListener = true;
      });
      appStateProvider.addExpense(expense);
      expect(notifiedListener, true);
      expect(appStateProvider.quantity, 200.0);
      expect(appStateProvider.expenses.length, 1);
    });

    test("should throw an exception when adding an expense with a quantity greater than the quantity", (){
      final Income income = Income(500.0, "Salario minimo");
      appStateProvider.addIncome(income);
      final Expense expense = Expense(600.0, "Cena con amigos", "Comida");
      expect(() => appStateProvider.addExpense(expense), throwsException);
    });
  });
}