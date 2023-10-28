import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/styles/device_screen.dart';
import '../../../managers/controllers/book_controller.dart';
import '../../../managers/controllers/helpers/counters/counters_helper.dart';
import '../../../managers/controllers/page_controller.dart';
import '../../../managers/state_manager/page_filter_provider.dart';
import '../../../managers/state_manager/pdf_view_loaded_provider.dart';
import '../../../managers/state_manager/scroll_page_indicator_provider.dart';
import '../../../managers/state_manager/scroll_view_provider.dart';
import '../../../managers/state_manager/top_bar_provider.dart';
import '../views/scroll_bar/scroll_bar.dart';

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
                updateOnPageScroll(ref, newPage: currentPage, isIncrement: true);
              }
              if (currentPage < lastPage){
                updateOnPageScroll(ref, newPage: currentPage, isIncrement: false);
              }

              //update completion state
              if(currentPage == bookModel.totalPages) {
                markAsComplete();
              }

              //refresh fab button
              checkFab(ref);
              //update scroll view position
              updateScrollIndicatorPosition(context, ref, currentPage);
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
    double maxScreenLimit = DeviceScreen(context).height - CustomScrollBar.limit;
    ref.read(scrollViewPositionProvider.notifier).updateWithPage(context, currentPage, minScreenLimit, maxScreenLimit);
  }
}



