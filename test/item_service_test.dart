import 'package:test/test.dart';

import 'package:mocktail/mocktail.dart';

import 'package:test_fundamentals/item.dart';
import 'package:test_fundamentals/item_repository.dart';
import 'package:test_fundamentals/item_service.dart';

// Is not recommended
// class ItemRepositoryFake implements IItemRepository {
//   @override
//   Future<List<Item>> getAllItems() async {
//     return <Item>[];
//   }

//   @override
//   List<Item> getAllItemsSync() {
//     return [];
//   }

//   @override
//   Item getById(int id) {
//     return Item(name: 'Item teste', price: 10.0);
//   }
// }

class ItemRepositoryFake extends Mock implements IItemRepository {}

void main() {
  late IItemRepository itemRepository;

  setUp(() {
    itemRepository = ItemRepositoryFake();
  });

//   test('Search all items', () async {
//     var service = ItemService(
//       repository: ItemRepositoryFake(),
//     );
//     final items = await service.getAllItems();
//     expect(items, <Item>[]);
//   });

  test('Search all items', () async {
    when(
      () => itemRepository.getAllItems(),
    ).thenAnswer(
      (_) async => <Item>[],
    );

    var service = ItemService(
      repository: itemRepository,
    );
    final items = await service.getAllItems();
    expect(items, <Item>[]);
  });

    test('Search by id', ()  {
    when(
      // () => itemRepository.getById(1),
      () => itemRepository.getById(any()),
    ).thenReturn(
      Item(name: 'Item X', price: 10),
    );

    var service = ItemService(repository: itemRepository);
    // var item = service.getById(1);
    var item = service.getById(1);
    // verify(() => itemRepository.getById(any())).called(1);
    expect(item, isNotNull);
  });
}
