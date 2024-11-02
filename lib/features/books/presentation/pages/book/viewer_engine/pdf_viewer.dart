import 'package:flip_streak/features/books/presentation/pages/book/viewer_engine/controller/reader_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../managers/controllers/book_controller.dart';
import '../../../managers/state_manager/book_list_provider.dart';
import '../../../managers/state_manager/last_book_provider.dart';
import '../../../managers/state_manager/page_filter_provider.dart';
import '../../../managers/state_manager/pdf_view_loaded_provider.dart';
import '../../../managers/state_manager/top_bar_provider.dart';

class PdfViewer extends ConsumerStatefulWidget {
  const PdfViewer({Key? key, this.initialPage}) : super(key: key);

  static final ReaderController _reader = ReaderController();

  static ColorFilter pageFilter = filterNormalPage;
  final int? initialPage;

  @override
  ConsumerState<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends ConsumerState<PdfViewer> {
  @override
  Widget build(BuildContext context) {

    final filter = ref.watch(pageFilterProvider);

    PdfViewer._reader.togglePageFilter(filter, PdfViewer.pageFilter); //change page color filter


    return ColorFiltered(
      colorFilter: PdfViewer.pageFilter,

      child: PDFView(
        filePath: bookModel.path,
        defaultPage: PdfViewer._reader.openInitialPage(widget.initialPage),
        swipeHorizontal: false,
        autoSpacing: false, //
        pageFling: false, //
        pageSnap: false, //
        nightMode: false,

        onViewCreated: (controller){
          ReaderController.injectController(pdf: controller);

          //show scrollbar, unless total pages is 0
          if(bookModel.totalPages != 0){
            ref.read(pdfViewLoadedProvider.notifier).show();
          }
          //show topBar
          ref.read(topbarProvider.notifier).keepOpen();

          // Refresh LastBook Widget provider
          ref.read(lastBookProvider.notifier).updateLastBookWidget(bookModel);

          //update last (read date) on book
          ref.read(bookListProvider.notifier).updateLastTimeRead();
        },

        onPageChanged: (int? page, int? total) {
          int lastPage = bookModel.lastPage;
          int currentPage = page ?? 0;

          // update counters & states
          if (currentPage > lastPage) {
            PdfViewer._reader.updateOnPageScroll(ref, newPage: currentPage, isIncrement: true);
          }
          if (currentPage < lastPage){
            PdfViewer._reader.updateOnPageScroll(ref, newPage: currentPage, isIncrement: false);
          }

          //update completion state
          if(currentPage == bookModel.totalPages) {
            markAsComplete();
          }

          //refresh fab button
          ReaderController.checkFab(ref);
          //update scroll view position
          PdfViewer._reader.updateScrollIndicatorPosition(context, ref, currentPage);
        },
      ),
    );
  }
}



