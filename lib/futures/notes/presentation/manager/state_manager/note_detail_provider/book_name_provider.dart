import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookNameProvider = StateNotifierProvider<BookNameProvider, String>((ref) {

  return BookNameProvider();
});


class BookNameProvider extends StateNotifier<String> {

  BookNameProvider() : super("");

  updateValue(String value) => state = value;

  clear() => state = "";

}