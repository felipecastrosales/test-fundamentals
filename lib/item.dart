class Item {
  String name;
  double price;

  Item({
    required this.name,
    required this.price,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.name == name &&
      other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
