import 'dart:async';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/constants/color_constants.dart';
import '../../../../../../../core/shared_pref/hive_client.dart';
import '../../../../../../../core/styles/device_screen.dart';
import '../../../../../data/local_db/book_client.dart';
import '../../../../../data/model/book_model.dart';
import '../../../../managers/controllers/book_controller.dart';
import '../../../../managers/controllers/helpers/counters/counters_helper.dart';
import '../../../../managers/state_manager/bookmark_list_provider.dart';
import '../../../../managers/state_manager/scroll_page_indicator_provider.dart';
import '../../../../managers/state_manager/scroll_view_provider.dart';
import '../../views/scroll_bar/scroll_bar.dart';

class ReaderController{
  static PDFViewController? pdfController;
  static EpubController? epubController;

  static final CountersHelper counters = CountersHelper();


  void togglePageFilter(int filter, ColorFilter pageFilter){
    switch(filter){
      case 0:
        pageFilter = filterNormalPage;
        break;
      case 1:
        pageFilter = filterGreyedLook;
        break;
      case 2:
        pageFilter = filterEyeCare;
        break;
      case 3:
        pageFilter = filterDarkPage;
        break;
      default:
        pageFilter = filterNormalPage;
    }
  }


  Color? getBackgroundColor(int filter){
    if (filter == 0){
      return const Color.fromRGBO(241, 241, 241, 0.9686274509803922);

    }
    if (filter == 1){
      return const Color.fromRGBO(236, 236, 236, 0.5);

    }
    if (filter == 2) {
      return const Color.fromRGBO(40, 36, 36, 1.0);

    }
    if (filter == 3){
      return const Color.fromRGBO(255,255,255, 0.95);

    }  else {
      return null;
    }
  }

  int openInitialPage (int? initialPage) {
    int currentPage = 0;
    //If there is an initial page specified, open it.
    //if not, open last page user have been on.
    initialPage != null
        ? currentPage = initialPage
        : currentPage = bookModel.lastPage;

    return currentPage;
  }


  showPageIndicator (WidgetRef ref){
    ref.read(scrollPagesIndicatorProvider.notifier).show();

    Timer(const Duration(milliseconds: 2000), () {
      ref.read(scrollPagesIndicatorProvider.notifier).hide();
    });

  }

  updateOnPageScroll(WidgetRef ref, {required int newPage, required bool isIncrement}){
    //update page & streak counters
    counters.updateCounters(ref, isIncrement: isIncrement);
    //update last page
    updateLastPage(pageNumber: newPage);
    // Show pages number indicator
    showPageIndicator(ref);
  }

  updateScrollIndicatorPosition(BuildContext context, WidgetRef ref, int currentPage){
    double minScreenLimit = 80;
    double maxScreenLimit = AppScreen(context).height - CustomScrollBar.limit;
    ref.read(scrollViewPositionProvider.notifier).updateWithPage(context, currentPage, minScreenLimit, maxScreenLimit);
  }


  ///
  ///
  static HiveClient hiveClient = HiveClient();

  static injectController({PDFViewController? pdf, EpubController? epub}){
    pdfController = pdf;
    epubController = epub;
  }

  /// Jump to page
  static void jumpToPage(int page){
    //pdf
    if(pdfController != null){
      pdfController!.setPage(page);
    }

    //epub
    if(epubController != null){
      //TODO: We currently scroll by chapters not indexes
      epubController!.jumpTo(index: page);
    }
  }


  /// Check Fab on page change
  static void checkFab(WidgetRef ref,) {

    // update FAB bookmark button
    ref.read(bookmarkListProvider.notifier)
        .toggleBookmarkButton();

  }

  /// Update Last page
  static updateLastPage({required int pageNumber}) {

    // update Book Model
    bookModel = bookModel.copyWith(lastPage: pageNumber,);

    hiveClient.updateLastPage(pageNumber);

    // update last page
    updateBookDetails();
  }

  /// Update Last page - from hive - updates on last widget
  static refreshLastPageFromHiveAndGetBook(BookModel model) async {
    BookClient bookClient = BookClient.instance;
    int savedPageNumber = await hiveClient.getLastPage();


    if(savedPageNumber != 0) {
      model = model.copyWith(lastPage: savedPageNumber);
      await bookClient.updateItem(model); //update item
    }

    return model;
  }


  static Future<int?> getCurrentPage(){
    if(pdfController != null){
      return pdfController!.getCurrentPage();

    } else {
      return Future.value(epubController!.currentValueListenable.value?.chapterNumber);
    }
  }

  static setCurrentPage(int page){
    if(pdfController != null){
      pdfController!.setPage(page);
    }

    if(epubController != null){
      epubController!.jumpTo(index: page);
    }
  }

  static dispose(){
    pdfController = null;
    epubController = null;
  }
}













