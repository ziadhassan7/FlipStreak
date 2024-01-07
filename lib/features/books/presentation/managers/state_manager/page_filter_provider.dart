import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageFilterProvider = StateNotifierProvider<PageFilterProvider, int>((ref) {

  return PageFilterProvider();
});


class PageFilterProvider extends StateNotifier<int>{
  PageFilterProvider() : super(0);

  void changeIndex(int index) async {

    state = index;
  }
}