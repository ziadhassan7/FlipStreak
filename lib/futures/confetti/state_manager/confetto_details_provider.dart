import 'package:flutter_riverpod/flutter_riverpod.dart';

final confettiDetailsProvider = StateNotifierProvider<ConfettiDetailsProvider, bool>((ref) {

  return ConfettiDetailsProvider();
});


class ConfettiDetailsProvider extends StateNotifier<bool>{

  ConfettiDetailsProvider() : super(false);

  void showConfetti() {
    state = true;
    Future.delayed(const Duration(milliseconds: 600), ()=> state = false); //re-close state
  }
  void hideConfetti() => state = false;

}