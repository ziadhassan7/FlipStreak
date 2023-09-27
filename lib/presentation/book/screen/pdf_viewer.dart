import 'package:flip_streak/business/print_debug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../business/app_wise/counters/counters_helper.dart';
import '../../../business/app_wise/controllers/page_controller.dart';
import '../../../provider/page_filter_provider.dart';
import '../../../provider/search_text_provider.dart';

class PdfViewer extends ConsumerWidget {
  const PdfViewer({Key? key, this.initialPage}) : super(key: key);

  static final CountersHelper counters = CountersHelper();

  static ColorFilter _pageFilter = filterNormalPage;
  final int? initialPage;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final filter = ref.watch(pageFilterProvider);
    ref.watch(searchTextProvider);

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

              PrintDebug("What The Fuck Is going: created", bookModel.lastPage);
            },

            onPageChanged: (int? page, int? total) {
              int lastPage = bookModel.lastPage;
              int currentPage = page ?? 0;

              if (currentPage > lastPage) {
                counters.updateCounters(ref, isIncrement: true);
                updateLastPage(pageNumber: currentPage);
                checkFab(ref);

              }
              if (currentPage < lastPage){
                counters.updateCounters(ref, isIncrement: false);
                updateLastPage(pageNumber: currentPage);
                checkFab(ref);
              }

              if(currentPage == bookModel.totalPages) {
                markAsComplete();
              }

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
    //If there is an initial page specified, open it.
    //if not, open last page user have been on.
    initialPage != null
        ? currentPage = initialPage!
        : currentPage = bookModel.lastPage;

    PrintDebug("What The Fuck Is going: initial model", currentPage);

    return currentPage;
  }

}



