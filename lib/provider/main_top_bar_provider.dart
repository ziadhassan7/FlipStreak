import 'package:flutter_riverpod/flutter_riverpod.dart';

final topbarProvider = StateNotifierProvider<MainTopBarProvider, bool>((ref) {

  return MainTopBarProvider();
});


class MainTopBarProvider extends StateNotifier<bool>{
  MainTopBarProvider() : super(false);

  void toggle() {

    state = !state;
  }

  void keepOpen() {

    state = true;
  }

  void keepClosed() {

    state = false;
  }
}