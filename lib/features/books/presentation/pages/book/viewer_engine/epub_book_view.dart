import 'dart:io';
import 'package:flutter/material.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../managers/controllers/book_controller.dart';
import '../../../managers/state_manager/book_list_provider.dart';
import '../../../managers/state_manager/last_book_provider.dart';
import '../../../managers/state_manager/page_filter_provider.dart';
import '../../../managers/state_manager/pdf_view_loaded_provider.dart';
import '../../../managers/state_manager/top_bar_provider.dart';
import 'controller/reader_controller.dart';

class EpubBookView extends ConsumerStatefulWidget {
  const EpubBookView({Key? key, required this.filePath, this.initialPage,}) : super(key: key);

  final String filePath;
  final int? initialPage;

  @override
  EpubBookViewState createState() => EpubBookViewState();
}

class EpubBookViewState extends ConsumerState<EpubBookView> {
  static final ReaderController _reader = ReaderController();

  static ColorFilter pageFilter = filterNormalPage;

  late EpubController epubController;

  @override
  void initState() {
    super.initState();

    final epubDocument = EpubDocument.openFile(File(widget.filePath));
    epubController = EpubController(document: epubDocument,);
    ReaderController.injectController(epub: epubController);
  }

  @override
  void dispose() {
    epubController.dispose();
    ReaderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final filter = ref.watch(pageFilterProvider);

    _reader.togglePageFilter(filter, pageFilter); //change page color filter

    return ColorFiltered(
      colorFilter: pageFilter,

      child: EpubView(
          controller: epubController,

          onDocumentLoaded: (book){

            Future.delayed(Duration(milliseconds: 700), (){
              //TODO: This would scroll to index not chapter, and we save the chapters
              //epubController.jumpTo(index: _reader.openInitialPage(widget.initialPage));
            });

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

          onChapterChanged: (value){

            int lastPage = bookModel.lastPage;
            int currentPage = value?.chapterNumber ?? 0; //TODO: We currently scroll by chapters, what about indexes?

            // update counters & states
            if (currentPage > lastPage) {
              _reader.updateOnPageScroll(ref, newPage: currentPage, isIncrement: true);
            }
            if (currentPage < lastPage){
              _reader.updateOnPageScroll(ref, newPage: currentPage, isIncrement: false);
            }

            //update completion state
            if(currentPage == bookModel.totalPages) {
              markAsComplete();
            }

            //refresh fab button
            ReaderController.checkFab(ref);
            //update scroll view position
            _reader.updateScrollIndicatorPosition(context, ref, currentPage);
          },
      ),
    );
  }
}
