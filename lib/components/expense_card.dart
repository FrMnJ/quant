import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String quantity;
  final String category;
  final String description;

  const ExpenseCard({
    super.key,
    required this.quantity,
    required this.category,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.primary,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$$quantity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Categoría: $category', // Display category
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Descripción: $description',
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  color: colorScheme.onPrimary,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  color: colorScheme.error,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}