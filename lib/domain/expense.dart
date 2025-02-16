
class Expense {
  double quantity;
  String description;
  String category;

  Expense(
    this.quantity,
    this.description,
    this.category,
  );

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'description': description,
      'category': category,
    };
  }

  static Expense fromJson(Map<String, dynamic> expenseJSON) {
    return Expense(expenseJSON["quantity"], expenseJSON["description"],
        expenseJSON["category"]);
  }
}
