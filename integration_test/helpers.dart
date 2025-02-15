import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> addIncome(
    WidgetTester tester, String amount, String description) async {
  await tester.tap(find.byKey(Key('addIncomeButton')));
  await tester.pumpAndSettle();

  await tester.enterText(find.byKey(Key('amountField')), amount);
  await tester.enterText(find.byKey(Key('descriptionField')), description);

  await tester.tap(find.byKey(Key('saveIncomeButton')));
  await tester.pumpAndSettle();

  await tester.runAsync(() async {
    await Future.delayed(const Duration(seconds: 2));
  });
  await tester.pumpAndSettle();
}

Future<void> addExpense(WidgetTester tester, String amount, String description,
    String category) async {
  await tester.tap(find.byKey(Key('addExpenseButton')));
  await tester.pumpAndSettle();

  await tester.enterText(find.byKey(Key('amountField')), amount);
  await tester.enterText(find.byKey(Key('descriptionField')), description);

  await tester.tap(find.byKey(Key('categoryDropdown')));
  await tester.pump();
  await tester.tap(find.text(category).last);
  await tester.pump();

  await tester.tap(find.byKey(Key('saveExpenseButton')));
  await tester.pumpAndSettle();
  await tester.runAsync(() async {
    await Future.delayed(const Duration(seconds: 2));
  });
  await tester.pumpAndSettle();
}
