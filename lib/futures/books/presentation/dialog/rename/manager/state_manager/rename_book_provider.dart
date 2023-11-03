import 'package:flutter_riverpod/flutter_riverpod.dart';

final renameStatusMessageProvider = StateNotifierProvider<RenameStatusMessageProvider, bool>((ref) {

  return RenameStatusMessageProvider();
});


class RenameStatusMessageProvider extends StateNotifier<bool>{

  RenameStatusMessageProvider() : super(false);

  void show() => state = true;
  void hide() => state = false;

}