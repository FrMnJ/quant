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

class IncomeCreationFormState extends State<IncomeCreationForm> {
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
            const SizedBox(height: 30),
            _buildTitle(colorScheme),
            const SizedBox(height: 30),
            _buildQuantityField(colorScheme),
            const SizedBox(height: 30),
            _buildDescriptionField(colorScheme),
            const SizedBox(height: 30),
            _buildSaveButton(context, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(ColorScheme colorScheme) {
    return Text(
      'Añadir Ingreso',
      style: TextStyle(
        fontSize: 32,
        color: colorScheme.onSurface,
      ),
    );
  }

  Widget _buildQuantityField(ColorScheme colorScheme) {
    return TextFormField(
      controller: quantityController,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      key: Key("amountField"),
      validator: (quantity) {
        if (quantityController.text.length > 6) {
          return "Número demasiado largo, trata de reducirlo";
        }
        return null;
      },
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[\\-|\\ ]'))],
      decoration: InputDecoration(
        labelText: 'Cantidad',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
        ),
      ),
      style: TextStyle(color: colorScheme.onSurface),
    );
  }

  Widget _buildDescriptionField(ColorScheme colorScheme) {
    return TextFormField(
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
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
        ),
      ),
      style: TextStyle(color: colorScheme.onSurface),
    );
  }

  Widget _buildSaveButton(BuildContext context, ColorScheme colorScheme) {
    return Center(
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
              _saveIncome(context, colorScheme);
            }
          },
          child: Text(
            "Añadir ingreso",
            style: TextStyle(
              color: colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }

  void _saveIncome(BuildContext context, ColorScheme colorScheme) {
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
}