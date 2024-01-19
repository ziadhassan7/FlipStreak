import 'package:flip_streak/core/utils/system_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state_manager/pdf_view_loaded_provider.dart';
import '../../state_manager/top_bar_provider.dart';

class ExitBookHandler {

  static closeBook(WidgetRef ref) {
    //disable status bar color when going back
    SystemUtil.disableStatusBarColor();
    //Screen can dim out now
    SystemUtil.letScreenRest();
    //make sure Top bar is closed before leaving
    ref.read(topbarProvider.notifier).keepClosed();
    //reset ViewCreated state on book
    ref.read(pdfViewLoadedProvider.notifier).reset();
  }
}