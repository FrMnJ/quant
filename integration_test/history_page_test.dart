import 'package:flutter_test/flutter_test.dart';
import 'package:quant/main.dart';

import 'helpers.dart';

void main(){
  group("e2e history page", (){
    testWidgets("should could view the expenses and incomes added", (WidgetTester tester) async{
      await tester.pumpWidget(App());
      await addIncome(tester, "500", "Sueldo");
      await addExpense(tester, "500", "Cena con amigos", "Comida");
    });
  });
}