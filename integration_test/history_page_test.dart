import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quant/main.dart';

import 'helpers.dart';

void main(){
  group("e2e history page", (){
    testWidgets("should could view the expenses and incomes added", (WidgetTester tester) async{
      await tester.pumpWidget(App());
      await addIncome(tester, "500", "Sueldo");
      await addExpense(tester, "300", "Cena con amigos", "Comida");

      await tester.tap(find.byKey(Key('viewHistoryButton')));
      await tester.pumpAndSettle();

      // Income
      expect(find.text("Descripción: Sueldo"), findsOneWidget);
      expect(find.text("\$500.00"), findsOneWidget);

      // Expense
      expect(find.text("Descripción: Cena con amigos"), findsOneWidget);
      expect(find.text("Categoría: Comida"), findsOneWidget);
      expect(find.text("\$300.00"), findsOneWidget);
    });
  });
}