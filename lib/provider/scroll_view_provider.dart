import 'package:flip_streak/business/app_wise/controllers/book_controller.dart';
import 'package:flip_streak/business/app_wise/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../presentation/styles/device_screen.dart';


final scrollViewPositionProvider = StateNotifierProvider<ScrollViewProvider, double>((ref) {

  return ScrollViewProvider();
});


class ScrollViewProvider extends StateNotifier<double>{

  ScrollViewProvider() : super(0);

  updateWithPosition(BuildContext context, double position) {
    int totalPages = getTotalPages();
    double totalHeight = DeviceScreen(context).height-200;
    int ratio = ((position / totalHeight) *100).round();

    int page = ((ratio*totalPages)/100).round();

    jumpToPage(page);

    state = position;
  }

  updateWithPage(BuildContext context, int page) {
    int totalPages = getTotalPages();
    double totalHeight = DeviceScreen(context).height-200;

    double ratio = (page / totalPages) *100;
    double position = (ratio*totalHeight)/100;

    state = position;
  }

  void reset() {
    state = 0;
  }
}