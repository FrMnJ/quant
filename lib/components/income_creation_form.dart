
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quant/domain/income.dart';
import 'package:quant/state/quantity_state_provider.dart';

class IncomeCreationForm extends StatefulWidget {
  const IncomeCreationForm({super.key});

  @override
  IncomeCreationFormState createState() {
    return IncomeCreationFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class IncomeCreationFormState extends State<IncomeCreationForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final quantityController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    quantityController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  double get quantityNum {
    return double.parse(quantityController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text(
              'Añadir Ingreso',
              style: TextStyle(
              fontSize: 32,
              color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: quantityController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              key: Key("amountField"),
              validator: (quantity){
                if(quantityController.text.length > 6){
                  return "Número demasiado largo, trata de reducirlo";
                }
                return null;
              },
              inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[\\-|\\ ]'))],
              decoration: InputDecoration(
                labelText: 'Cantidad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30.0),
            TextFormField(
              controller: descriptionController,
              key: Key("descriptionField"),
              validator: (description) {
                if (descriptionController.text.length < 3) {
                  return "Ingresa una descripción de 3 o más caracteres.";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  key: Key("saveIncomeButton"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(colorScheme.primary),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        Income income = Income(quantityNum, descriptionController.text.trim());
                        context.read<QuantityStateProvider>().addIncome(income);
                        Navigator.pushNamed(context, '/home');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Ingreso añadido correctamente"),
                          ),
                        );
                      } on Exception catch (_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: colorScheme.error,
                            content: Text("Error al convertir cantidad a número."),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    "Añadir ingreso",
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                    )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}