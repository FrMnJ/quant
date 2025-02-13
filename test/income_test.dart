import 'package:flutter_test/flutter_test.dart';
import 'package:quant/domain/income.dart';

void main(){
  group("Income", (){
    late Income income;
    setUp((){
        income = Income(500.0, "Salario minimo");
    });

    test("should provide the quantity field", (){
      expect(income.quantity, 500.0);
    });

    test("should provide the description field", (){
        expect(income.description, "Salario minimo");
    });
  });
}
