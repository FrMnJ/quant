import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quant/main.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end home page", (){
    testWidgets("The app opens and shows the finance balance", (WidgetTester tester) async{
      await tester.pumpWidget(App());

      expect(find.text('Bienvenido'), findsOneWidget);
      expect(find.text('\$0.00'), findsOneWidget);
      expect(find.text('Añadir ingreso'), findsOneWidget);
      expect(find.text('Añadir gasto'), findsOneWidget);
      expect(find.byKey(Key('addIncomeButton')), findsOneWidget);
      expect(find.byKey(Key('addExpenseButton')), findsOneWidget);
    });
  });
}