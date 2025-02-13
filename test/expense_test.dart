import 'package:flutter_test/flutter_test.dart';
import 'package:quant/domain/expense.dart';

void main(){
  group("Expense", (){
    late Expense expense;
    setUp((){
      expense = Expense(300.0, "Cena con amigos", "Comida");
    });

    test("Should have field quantity", (){
        expect(expense.quantity, 300.0);
    });

    test("Should have field description", (){
        expect(expense.description, "Cena con amigos");
    });

    test("Should have field category", (){
        expect(expense.category, "Comida");
    });
  });
}
