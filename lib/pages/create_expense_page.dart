import 'package:flutter/material.dart';
import 'package:quant/components/expense_creation_form.dart';

class CreateExpensePage extends StatelessWidget{
  const CreateExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: SafeArea(
          child: ExpenseCreationForm()
        ),
     );
  }
}