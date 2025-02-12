import 'package:flutter/material.dart';

class Quant extends StatelessWidget {
  const Quant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Center( 
      child: Text(
        "\$00.00",
        style: TextStyle(
          fontSize: 48,
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}