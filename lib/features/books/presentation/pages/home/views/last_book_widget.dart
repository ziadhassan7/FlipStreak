import 'package:flip_streak/features/app_common_views/text_view/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/app_router.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/book_thumbnail.dart';
import '../../../../data/model/book_model.dart';
import '../../../managers/controllers/book_controller.dart';
import '../../../managers/controllers/page_controller.dart';
import '../../../managers/state_manager/book_list_provider.dart';
import '../../../managers/state_manager/last_book_provider.dart';
import '../../book/screen/book_page.dart';

class LastBookWidget extends ConsumerWidget {
  const LastBookWidget({Key? key}) : super(key: key);

  static final GlobalKey pdfKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    BookModel? model = ref.watch(lastBookProvider);
    ref.watch(bookListProvider);

    return FutureBuilder(
      future: loadData(model),
      builder: (context, snapshot) {

        return snapshot.hasData
        ? infoWidget(context, snapshot.data!)
        : const SizedBox();
      }
    );
  }


  Widget infoWidget(BuildContext context, BookModel model){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextView("Continue Reading", size: 18, weight: FontWeight.bold,),

          const SizedBox(height: 10,),

          InkWell(

            onTap: () async => await onTap(context, model),

            child: Container(
              height: 140, // Widget height
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: const BoxDecoration(
                  color: colorLastBookWidget,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),

              child: Row(
                children: [

                  /// Book Thumbnail
                  Padding(
                    padding: const CustomPadding(right: 25),
                    child: SizedBox(
                      height: 100, width: 75,

                      child: InkWell(
                        onTap: () async => await onTap(context, model),
                        child: BookThumbnail(filePath: model.path, page: model.lastPage,)),
                    ),
                  ),


                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        /// Text - Book Name
                        TextView(
                          model.id,
                          color: Colors.white, maxLine: 2,
                          overflow: TextOverflow.ellipsis,),

                        /// Text - Last Page
                        TextView(
                          "page. ${model.lastPage.toString()}",
                          color: Colors.white24,),

                        const Spacer(),

                        /// Progress bar
                        progressBar(model),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  ///                                                                           / Custom Widgets
  Widget progressBar(BookModel model) {

    // Prevent division by 0
    if(model.totalPages == 0) return const SizedBox();
    //

    return Row(
      children: [
        /// Progress Bar
        Expanded(
            flex: 4,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  color: colorOrange,
                  value: model.lastPage/model.totalPages,))),

        /// Space
        const SizedBox(width: 18,),

        /// Percent in text
        Expanded(
          flex: 1,
          child: TextView("${getPercentText(model)}%", color: Colors.white,))
      ],
    );
  }


  ///                                                                           / Functions
  //Load data
  Future<BookModel?> loadData(BookModel? model) async {

    if (model == null) {
      String bookId = await hive.getLastBook();
      model = await bookClient.readOneElement(bookId);

      // get last saved page and update it not repeat tasks
      return await refreshLastPageFromHiveAndGetBook(model);
    }

    return model;
  }

  //percent
  int getPercentText(BookModel model){
    double value = getPercent(model.lastPage,model.totalPages);

    if(value > 0 && value < 1){
      return value.ceil();
    } else {
      return value.floor();
    }
  }

  double getPercent(int page, int total) {

    double value = page/total;
    if (value == 1) return 100;

    return (page/total)*100;
  }


  Future<void> onTap(BuildContext context, BookModel model) async {
    // Globalize new bookModel data
    await globalizeCurrentBookModel(model).then((value) {
      // Open Details Page
      AppRouter
          .navigateTo(context, const BookPage(),);
    });

  }

}
