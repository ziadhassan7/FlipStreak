import 'package:flutter_riverpod/flutter_riverpod.dart';

final brightModeProvider = StateNotifierProvider<BrightModeProvider, bool>((ref) {

  return BrightModeProvider();
});


class BrightModeProvider extends StateNotifier<bool>{
  BrightModeProvider() : super(true);

  void brightMode() => state = true; //bright
  void darkMode() => state = false; //dark
}