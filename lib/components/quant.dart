import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quant/state/quantity_state_provider.dart';

class Quant extends StatelessWidget {
  const Quant({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      color: Colors.blueGrey[900],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Text(
          "\$${context.watch<QuantityStateProvider>().quantityAsString()}",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
