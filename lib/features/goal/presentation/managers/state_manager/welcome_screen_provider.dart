import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Pages {
  firstPage,
  secondPage,
  thirdPage
}
final welcomeScreenProvider = StateNotifierProvider<WelcomeScreenProvider, Pages>((ref) {

  return WelcomeScreenProvider();
});


class WelcomeScreenProvider extends StateNotifier<Pages>{
  WelcomeScreenProvider() : super(Pages.firstPage);

  void changeIndex(Pages currentPage) {
    state = currentPage;
  }
}