import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/shared_pref/hive_client.dart';
import '../../../data/local_db/book_client.dart';

final categoriesProvider = StateNotifierProvider<CategoriesProvider, List>((ref) {

  return CategoriesProvider();
});


class CategoriesProvider extends StateNotifier<List>{
  BookClient bookClient = BookClient.instance;
  HiveClient hiveClient = HiveClient();

  CategoriesProvider() : super([]){
    _getAllCategories();
  }

  Future<void> _getAllCategories() async {
    state = await hiveClient.getCategories();
  }

  Future<void> onSearchChanged(String searchResult) async {
    List allCategories = await hiveClient.getCategories();
    List filteredList = []; //make it empty again

    for(String category in allCategories){
      if(category.contains(searchResult)) filteredList.add(category);
    }

    state = [];
    state = filteredList;
  }

  /// Add
  Future<void> addCategoryItem (String newItem) async {
    List currentList = await hiveClient.getCategories();
    //add new item only, if it doesn't exist
    if (!currentList.contains(newItem)) currentList.add(newItem);

    //update current list
    hiveClient.updateCategories(currentList);

    state = [];
    state = currentList;
  }


  /// Update
  Future<void> updateCategoryItem ({
    required int index,
    required String oldTitle,
    required String newTitle,}) async {

    if (oldTitle != newTitle){

      List currentList = await hiveClient.getCategories();

      //Update element
      currentList[index] = newTitle;

      //update current list
      hiveClient.updateCategories(currentList);

      state = [];
      state = currentList;
    }
  }


  /// Delete
  Future<void> deleteCategoryItem (String item) async {
    List currentList = await hiveClient.getCategories();

    //remove element
    currentList.remove(item);

    //update current list
    hiveClient.updateCategories(currentList);

    state = [];
    state = currentList;
  }
}