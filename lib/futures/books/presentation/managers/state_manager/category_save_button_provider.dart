import 'package:flutter_riverpod/flutter_riverpod.dart';

final categorySaveButtonProvider = StateNotifierProvider<CategorySaveButtonProvider, bool>((ref) {

  return CategorySaveButtonProvider();
});


class CategorySaveButtonProvider extends StateNotifier<bool>{

  CategorySaveButtonProvider() : super(false);

  void showSaveButton() => state = true;
  void hideSaveButton() => state = false;

}