import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/styles/box_decoration.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../books/data/model/book_model.dart';
import '../widget/completed_book_item.dart';
import 'zi_grouped_list.dart';

class CompletedBooksWidget extends StatelessWidget {
  const CompletedBooksWidget({Key? key, required  this.books}) : super(key: key);

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const CustomPadding(horizontal: 30, vertical: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Padding(
            padding: CustomPadding(horizontal: 12),
            child: TextView("Completed Books", size: 20,),
          ),

          alignmentWidget(),

          Container(
            padding: const CustomPadding(horizontal: 20, bottom: 100),

            decoration: CustomDecoration(
                backgroundColor: Colors.white, //colorBackground
                radius: 30,
                borderWidth: 2,
                borderColor: colorAccent.withOpacity(0.4)
            ),

            child: ZiGroupedList.grid(
              shrinkWrap: true,
              crossAxisCount: 3,
              items: books,
              sortBy: (element){
                //PrintDebug("achiv", "${element.id}, ${element.completeDate}");
                int year = DateTime.parse(element.completeDate!).year;
                return year;
              },
              itemBuilder: (context, item){
                String name = basename(item.id); //removes .pdf
                return CompletedBookItem(
                    bookName: name,
                    bookModel: item
                );
              },
              groupSeparatorBuilder: (year) {
                  return TextView(
                    year.toString(),
                    size: 18,
                    weight: FontWeight.bold,
                    color: colorAccent,
                  );
                },
            )
          ),
        ],
      ),
    );
  }

  Widget alignmentWidget(){
    return const SizedBox(height: 16,);
  }

}
