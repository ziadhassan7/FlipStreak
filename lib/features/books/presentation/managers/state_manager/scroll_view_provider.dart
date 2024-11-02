import 'package:flip_streak/features/books/presentation/managers/controllers/book_controller.dart';
import 'package:flip_streak/features/books/presentation/pages/book/viewer_engine/controller/reader_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/page_controller.dart';


final scrollViewPositionProvider = StateNotifierProvider<ScrollViewProvider, double>((ref) {

  return ScrollViewProvider();
});


class ScrollViewProvider extends StateNotifier<double>{
  static double minScreenLimit = 80;

  ScrollViewProvider() : super(minScreenLimit);


  updateWithPosition(BuildContext context, double position, double minScreenHeight, double maxScreenHeight) {
    int totalPages = getTotalPages();
    double totalHeight = maxScreenHeight - minScreenHeight;
    int ratio = (((position-minScreenHeight) / totalHeight) *100).round();

    int page = ((ratio*totalPages)/100).round();

    ReaderController.jumpToPage(page);

    state = position;
  }

  updateWithPage(BuildContext context, int page, double minScreenHeight, double maxScreenHeight) {
    int totalPages = getTotalPages();
    double totalHeight = maxScreenHeight - minScreenHeight;

    double ratio = (page / totalPages) *100;
    double position = (ratio*totalHeight)/100;

    state = (position + minScreenHeight);
  }

  void reset() {
    state = 0;
  }
}