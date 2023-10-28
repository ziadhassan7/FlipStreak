import 'package:flutter_riverpod/flutter_riverpod.dart';

final shareLoadingProvider = StateNotifierProvider<ShareLoadingProvider, bool>((ref) {

  return ShareLoadingProvider();
});


class ShareLoadingProvider extends StateNotifier<bool> {

  ShareLoadingProvider() : super(true); //loading

  toggle() => state = !state;

  loading() => state = true;
  finished() => state = false;

}