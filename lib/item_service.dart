import 'item.dart';
import 'item_repository.dart';

class ItemService {
  IItemRepository repository;

  ItemService({
    required this.repository,
  });

  Future<List<Item>> getAllItems() => repository.getAllItems();
  List<Item> getAllItemsSync() => repository.getAllItemsSync();
  Item getById(int id) => repository.getById(id);
}
