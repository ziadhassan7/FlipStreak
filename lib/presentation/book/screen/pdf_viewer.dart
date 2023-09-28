import 'dart:async';
import 'package:flip_streak/provider/top_bar_provider.dart';
import 'package:flip_streak/provider/scroll_page_indicator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../business/app_wise/counters/counters_helper.dart';
import '../../../business/app_wise/controllers/page_controller.dart';
import '../../../provider/page_filter_provider.dart';
import '../../../provider/pdf_view_loaded_provider.dart';

class PdfViewer extends ConsumerWidget {
  const PdfViewer({Key? key, this.initialPage}) : super(key: key);

  static final CountersHelper counters = CountersHelper();

  static ColorFilter _pageFilter = filterNormalPage;
  final int? initialPage;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final filter = ref.watch(pageFilterProvider);

    openInitialPage();

    togglePageFilter(filter); //change page color filter


    return ColorFiltered(
      colorFilter: _pageFilter,

      child: Stack(
        children: [

          PDFView(
            filePath: bookModel.path,
            defaultPage: openInitialPage(),
            swipeHorizontal: false,
            autoSpacing: false, //
            pageFling: false, //
            pageSnap: false, //
            nightMode: false,

            onViewCreated: (controller){
              pdfController = controller;

              ref.read(pdfViewLoadedProvider.notifier).show();
              ref.read(topbarProvider.notifier).keepOpen();
            },

            onPageChanged: (int? page, int? total) {
              int lastPage = bookModel.lastPage;
              int currentPage = page ?? 0;

              // update counters & states
              if (currentPage > lastPage) {
                updateOnPageScroll(ref, isIncrement: true);
              }
              if (currentPage < lastPage){
                updateOnPageScroll(ref, isIncrement: false);
              }

              //update completion state
              if(currentPage == bookModel.totalPages) {
                markAsComplete();
              }

              //update scroll view position
              //ref.read(scrollViewPositionProvider.notifier).updateWithPage(context, currentPage);
            },
          ),
        ],
      ),
    );
  }


  void togglePageFilter(int filter){
    switch(filter){
      case 0:
        _pageFilter = filterNormalPage;
        break;
      case 1:
        _pageFilter = filterGreyedLook;
        break;
      case 2:
        _pageFilter = filterEyeCare;
        break;
      case 3:
        _pageFilter = filterDarkPage;
        break;
      default:
        _pageFilter = filterNormalPage;
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

  int openInitialPage () {
    int currentPage = 0;
    //If there is an initial page specified, open it.
    //if not, open last page user have been on.
    initialPage != null
        ? currentPage = initialPage!
        : currentPage = bookModel.lastPage;

    return currentPage;
  }


  showPageIndicator (WidgetRef ref){
    ref.read(scrollPagesIndicatorProvider.notifier).show();

    Timer t = Timer(const Duration(milliseconds: 2000), () {
      ref.read(scrollPagesIndicatorProvider.notifier).hide();
    });

  }

  updateOnPageScroll(WidgetRef ref, {required bool isIncrement}){
    //update page & streak counters
    counters.updateCounters(ref, isIncrement: isIncrement);
    //update last page
    updateLastPage(pageNumber: currentPage);
    //refresh fab button
    checkFab(ref);
    // Hide Topbar
    ref.read(topbarProvider.notifier).keepClosed();
    // Show pages number indicator
    showPageIndicator(ref);
  }
}



