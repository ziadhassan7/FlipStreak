import 'package:flutter_riverpod/flutter_riverpod.dart';

final confettiLibraryProvider = StateNotifierProvider<ConfettiLibraryProvider, bool>((ref) {

  return ConfettiLibraryProvider();
});


class ConfettiLibraryProvider extends StateNotifier<bool>{

  ConfettiLibraryProvider() : super(false);

  void showConfetti() {
    state = true;
    Future.delayed(const Duration(milliseconds: 600), ()=> state = false); //re-close state
  }
  void hideConfetti() => state = false;

}