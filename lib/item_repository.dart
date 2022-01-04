import 'item.dart';

abstract class IItemRepository {
  Future<List<Item>> getAllItems();
  List<Item> getAllItemsSync(int id);
  Item getById(int id);
}

class ItemRepository implements IItemRepository {
  @override
  Future<List<Item>> getAllItems() async {
    final items = [
      Item(name: 'Galaxy', price: 1000),
      Item(name: 'Iphone', price: 10000),
      Item(name: 'USB-C', price: 200),
    ];
    // throw Exception();
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return items;
  }

  @override
  List<Item> getAllItemsSync(int id) {
    final items = [
      Item(name: 'Galaxy', price: 1000),
      Item(name: 'Iphone', price: 10000),
      Item(name: 'USB-C', price: 200),
    ];
    return items;
  }

  @override
  Item getById(int id) {
    return Item(
      name: 'iPhone X',
      price: 1000,
    );
  }
}
