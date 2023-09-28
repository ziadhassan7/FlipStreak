import 'package:flip_streak/presentation/views/book_thumbnail.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app_constants/color_constants.dart';
import '../../business/app_wise/controllers/book_controller.dart';
import '../../business/app_wise/controllers/page_controller.dart';
import '../../business/route_util.dart';
import '../../data/model/book_model.dart';
import '../../provider/book_list_provider.dart';
import '../../provider/last_book_provider.dart';
import '../book/screen/book_page.dart';

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
          TextInriaSans("Continue Reading", size: 18, weight: FontWeight.bold,),

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
                  Expanded(
                    flex: 4,
                    child: InkWell(
                      onTap: () async => await onTap(context, model),
                      child: BookThumbnail(filePath: model.path, page: model.lastPage,)),
                  ),

                  const Spacer(),

                  Expanded(
                    flex: 7, //it takes this space
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        /// Text - Book Name
                        TextInriaSans(
                          model.id,
                          color: Colors.white, maxLine: 2,
                          overflow: TextOverflow.ellipsis,),

                        /// Text - Last Page
                        TextInriaSans(
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
    return Row(
      children: [
        /// Progress Bar
        Expanded(
            flex: 3,
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
          child: TextInriaSans("${getPercentText(model)}%", color: Colors.white,))
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
  double getPercent(int page, int total) {

    double value = page/total;
    if (value == 1) return 100;

    return (page/total)*100;
  }

  int getPercentText(BookModel model){
    double value = getPercent(model.lastPage,model.totalPages);

    if(value > 0 && value < 1){
      return value.ceil();
    } else {
      return value.floor();
    }
  }

  Future<void> onTap(BuildContext context, BookModel model) async {
    // Globalize new bookModel data
    await globalizeCurrentBookModel(model).then((value) {
      // Open Details Page
      RouteUtil
          .navigateTo(context, const BookPage(),);
    });

  }

}
