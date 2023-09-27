import 'package:flutter_riverpod/flutter_riverpod.dart';


final pdfViewLoadedProvider = StateNotifierProvider<PdfViewLoadedProvider, bool>((ref) {

  return PdfViewLoadedProvider();
});


class PdfViewLoadedProvider extends StateNotifier<bool>{

  PdfViewLoadedProvider() : super(false);

  show() => state = true;

  reset() => state = false;

}