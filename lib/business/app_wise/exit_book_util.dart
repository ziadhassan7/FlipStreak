import 'package:flip_streak/business/system_util.dart';
import 'package:flip_streak/provider/book_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/last_book_provider.dart';
import '../../provider/top_bar_provider.dart';
import '../../provider/pdf_view_loaded_provider.dart';
import 'controllers/book_controller.dart';

class ExitBookHandler {

  static closeBook(WidgetRef ref) {
    //disable status bar color when going back
    SystemUtil.disableStatusBarColor();
    //Screen can dim out now
    SystemUtil.letScreenRest();
    //make sure Top bar is closed before leaving
    ref.read(topbarProvider.notifier).keepClosed();
    //update last (read date) on book
    ref.read(bookListProvider.notifier).updateLastTimeRead();
    //reset ViewCreated state on book
    ref.read(pdfViewLoadedProvider.notifier).reset();
    // Refresh LastBook Widget provider
    ref.read(lastBookProvider.notifier).updateWidget(bookModel);
  }
}