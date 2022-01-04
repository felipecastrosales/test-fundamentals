import 'package:test/test.dart';
import 'package:test_fundamentals/item.dart';
import 'package:test_fundamentals/item_repository.dart';

void main() {
  test('Get all Sync | 01', () async {
    var repository = ItemRepository(); // preparing
    var item = await repository.getAllItems(); // action - execution
    expect(item, isNotEmpty); // verifying
  });

  test('Get all Sync | 02', () {
    var repository = ItemRepository(); // preparing
    var getAllItems = repository.getAllItems; // action - execution
    expect(getAllItems(), completion(isNotEmpty)); // verifying
  });

  test('Get item by id', () {
    var repository = ItemRepository(); // preparing
    var item = repository.getById(1); // action - execution
    expect(item, isNotNull); // verifying
    expect(item, Item(name: 'iPhone X', price: 1000)); // verifying
    // expect(
    //   item,
    //   allOf([isNotNull, equals(Item(name: 'Iphone', price: 10000))]),
    // ); // verifying
  });
}
