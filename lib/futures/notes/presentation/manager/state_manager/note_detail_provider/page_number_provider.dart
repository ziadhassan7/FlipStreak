import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageNumberProvider = StateNotifierProvider<PageNumberProvider, String>((ref) {

  return PageNumberProvider();
});


class PageNumberProvider extends StateNotifier<String> {

  PageNumberProvider() : super("");

  updateValue(String value) => state = value;

  clear() => state = "";

}