import 'package:flutter_riverpod/flutter_riverpod.dart';


final scrollPagesIndicatorProvider = StateNotifierProvider<ScrollPageIndicatorProvider, bool>((ref) {

  return ScrollPageIndicatorProvider();
});


class ScrollPageIndicatorProvider extends StateNotifier<bool>{

  ScrollPageIndicatorProvider() : super(false);

  show() => state = true;

  hide() => state = false;

}