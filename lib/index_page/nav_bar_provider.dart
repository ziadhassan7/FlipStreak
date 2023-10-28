import 'package:flutter_riverpod/flutter_riverpod.dart';

final navBarProvider = StateNotifierProvider<NavBarProvider, int>((ref) {

  return NavBarProvider();
});


class NavBarProvider extends StateNotifier<int>{
  NavBarProvider() : super(0);

  void changeIndex(int index) async {

    state = index;
  }
}