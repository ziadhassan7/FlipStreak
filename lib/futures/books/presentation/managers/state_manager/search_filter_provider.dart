import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchFilterProvider = StateNotifierProvider<SearchFilterProvider, String>((ref) {

  return SearchFilterProvider();
});


class SearchFilterProvider extends StateNotifier<String>{

  SearchFilterProvider() : super("All");

  void updateCategory(String item) => state = item;

}