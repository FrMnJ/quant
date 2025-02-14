import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quant/main.dart';

import 'helpers.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end expenses page",(){
    testWidgets('user can add expenses', (WidgetTester tester) async{
      await tester.pumpWidget(App());
      await addIncome(tester, "500", "Sueldo");

      await tester.tap(find.byKey(Key('addExpenseButton')));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('amountField')), '300');
      await tester.enterText(find.byKey(Key('descriptionField')), 'Cena con amigos');

      await tester.tap(find.byKey(Key('categoryDropdown')));
      await tester.pump();
      await tester.tap(find.text('Comida').last);
      await tester.pump();

      await tester.tap(find.byKey(Key('saveExpenseButton')));
      await tester.pumpAndSettle();

      expect(find.text('Gasto añadido correctamente'), findsOneWidget);
      expect(find.text('\$200.00'), findsOneWidget);
    });
  });
}