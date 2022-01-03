import 'item.dart';

class Cart {
  List<Item> items;

  Cart({
    required this.items,
  });

  double totalCart() {
    // var total = 0.0;
    // // for (var i = 1; i <= items.length; i++) { error
    // for (var i = 0; i < items.length; i++) {
    //   // total = items[i].price;
    //   total += items[i].price;
    // }
    // return total;
    return items.fold(0.0, (total, item) => total += item.price);
  }

  double totalCartWithTaxes() {
    var total = totalCart();
    var tax = 0.10;

    if (total < 5000) {
      return total;
    } else if (total > 20000) {
      tax = 0.20;
    }

    total += (total * tax);
    return total;
  }
}
