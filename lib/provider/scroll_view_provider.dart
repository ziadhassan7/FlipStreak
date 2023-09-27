import 'package:flip_streak/business/app_wise/controllers/book_controller.dart';
import 'package:flip_streak/business/app_wise/controllers/page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final scrollViewProvider = StateNotifierProvider<ScrollViewProvider, double>((ref) {

  return ScrollViewProvider();
});


class ScrollViewProvider extends StateNotifier<double>{

  ScrollViewProvider() : super(0);

  update(double value, double totalHeight) {
    int total = getTotalPages();
    int ratio = ((value / totalHeight) *100).round();

    int page = ((ratio*total)/100).round();

    jumpToPage(page);
    state = value;
  }

  void reset() {
    state = 0;
  }
}