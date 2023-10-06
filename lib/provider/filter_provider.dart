import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterProvider = StateNotifierProvider<FilterProvider, String>((ref) {

  return FilterProvider();
});


class FilterProvider extends StateNotifier<String>{

  FilterProvider() : super("All");

  void updateCategory(String item) => state = item;

}