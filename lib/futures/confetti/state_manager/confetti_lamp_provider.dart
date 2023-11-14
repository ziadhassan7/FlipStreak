import 'package:flutter_riverpod/flutter_riverpod.dart';

final confettiLampProvider = StateNotifierProvider<ConfettiLampProvider, bool>((ref) {

  return ConfettiLampProvider();
});


class ConfettiLampProvider extends StateNotifier<bool>{

  ConfettiLampProvider() : super(false);

  void showConfetti() {
    state = true;
    Future.delayed(const Duration(milliseconds: 600), ()=> state = false); //re-close state
  }
  void hideConfetti() => state = false;

}