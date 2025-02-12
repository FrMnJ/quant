import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quant/main.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end home page", (){
    testWidgets("The app opens and shows the finance balance", (WidgetTester tester) async{
      await tester.pumpWidget(App());

      expect(find.text('Bienvenido'), findsOneWidget);
      expect(find.text('\$00.00'), findsOneWidget);
    });
  });
}