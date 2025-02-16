import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quant/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end incomes page", () {
    testWidgets('user can add incomes', (WidgetTester tester) async {
      await tester.pumpWidget(App());

      await tester.tap(find.byKey(Key('addIncomeButton')));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('amountField')), '500');
      await tester.enterText(find.byKey(Key('descriptionField')), 'Salario empleo');

      await tester.tap(find.byKey(Key('saveIncomeButton')));
      await tester.pumpAndSettle();

      expect(find.text('Ingreso añadido correctamente'), findsOneWidget);
      expect(find.text('\$500.00'), findsOneWidget);
    });
  });
}