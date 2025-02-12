import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quant/main.dart';
import 'package:flutter/material.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end home page", (){
    testWidgets("The app opens and shows the finance balance", (WidgetTester tester) async{
      await tester.pumpWidget(MyApp());

      expect(find.text('Bienvenido'), findsOneWidget);
      expect(find.text('\$00.00'), findsOneWidget);
    });

    testWidgets('user can add incomes', (WidgetTester tester) async{
      await tester.pumpWidget(MyApp());

      await tester.tap(find.byKey(Key('addIncomeButton')));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('amountField')), '500');
      await tester.enterText(find.byKey(Key('descriptionField')), 'Salario empleo');

      await tester.tap(find.byKey(Key('saveIncomeButton')));
      await tester.pumpAndSettle();

      expect(find.text('Ingreso añadido correctamente'), findsOneWidget);
      expect(find.text('\$500.00'), findsOneWidget);
    });

    testWidgets('user can add expenses', (WidgetTester tester) async{
      await tester.pumpWidget(MyApp());

      await tester.tap(find.byKey(Key('addExpenseButton')));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('amountField')), '300');
      await tester.enterText(find.byKey(Key('descriptionField')), 'Cena con amigos');

      await tester.tap(find.byKey(Key('categoryDropdown')));
      await tester.pump();
      await tester.tap(find.text('Comida'));
      await tester.pump();

      await tester.tap(find.byKey(Key('saveExpenseButton')));
      await tester.pumpAndSettle();

      expect(find.text('Gasto añadido correctamente'), findsOneWidget);
      expect(find.text('\$200.00'), findsOneWidget);
    });
  });
}