
import 'package:flutter/material.dart';
import 'package:quant/components/income_creation_form.dart';

class CreateIncomePage extends StatelessWidget{
  const CreateIncomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: SafeArea(
          child: IncomeCreationForm()
        ),
     );
  }
}

