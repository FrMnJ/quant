
class Income {
  double quantity;
  String description;

  Income(
    this.quantity,
    this.description,
  );

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'description': description,
    };
  }

  static Income fromJson(Map<String, dynamic> incomeJSON) {
    return Income(incomeJSON['quantity'], incomeJSON['description']);
  }
}