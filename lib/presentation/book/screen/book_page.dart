import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/book/widget/bookmark_fab.dart';
import 'package:flip_streak/presentation/book/screen/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business/app_wise/exit_book_util.dart';
import '../../../business/system_util.dart';
import '../../../provider/bright_mode_provider.dart';
import '../../../provider/top_bar_provider.dart';
import '../../../provider/pdf_view_loaded_provider.dart';
import '../../views/topbar/main_topbar/base_top_bar.dart';
import '../views/scroll_bar/scroll_bar.dart';
import '../widget/screen_touch_detector.dart';

class BookPage extends ConsumerWidget {
  const BookPage({Key? key, this.initialPage}) : super(key: key);

  final int? initialPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //Make Screen always awake (Never Dim out)
    SystemUtil.keepScreenAwake();

    disableTopbarOnLandscape(context, ref);

    SystemUtil.updateStatusBarColor(ref);

    return WillPopScope(

      onWillPop: () {
        ExitBookHandler.closeBook(ref);
        //navigate back and close
        return Future.value(true);
      },

      child: Scaffold(
        backgroundColor: dominateColor,

        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.topStart,

            children: [
              /// Document Screen
              PdfViewer(initialPage: initialPage),

              /// Touch Detector
              Consumer(
                  builder: (context, ref, child) {
                    return ScreenTouchDetector(widgetRef: ref,);
                  }
              ),

              /// Top bar
              Consumer(
                  builder: (context, ref, child) {
                    return Visibility(
                        visible: ref.watch(topbarProvider),
                        child:
                        topbar(ref));
                  }
              ),

              /// FAB
              Consumer(
                  builder: (context, ref, child) {
                    final isBright = ref.watch(brightModeProvider);

                    return Visibility(
                        visible: ref.watch(topbarProvider),
                        child: BookmarkFab(isBright));
                  }
              ),

              Consumer(
                builder: (context, ref, _) {
                  bool isBookViewCreated = ref.watch(pdfViewLoadedProvider);

                  return isBookViewCreated
                    ? const CustomScrollBar()
                    : const SizedBox();
                }
              )
            ],
          ),
        ),

      ),
    );
  }


  Widget topbar(WidgetRef ref) {
    return Consumer(
        builder: (context, ref, _) {

          bool isBright = ref.watch(brightModeProvider);

          final Color backgroundColor = isBright ? dominateColor : darkPrimary;
          final Color foregroundColor = isBright ? subColor : darkSecondary;

          return TopBar(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,);
    });
  }


  disableTopbarOnLandscape(BuildContext context, WidgetRef ref){

    Future.delayed(const Duration(milliseconds: 300), (){
      if(SystemUtil.isScreenLandscape(context)){
        ref.read(topbarProvider.notifier).keepClosed();
      }
    });

  }

}