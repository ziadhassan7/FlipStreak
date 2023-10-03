import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../../../app_constants/color_constants.dart';
import '../../../data/model/book_model.dart';
import '../../styles/box_decoration.dart';
import '../../styles/padding.dart';
import '../../views/text_inria_sans.dart';
import '../widget/completed_book_item.dart';
import 'my_grouped_list.dart';

class CompletedBooksWidget extends StatelessWidget {
  const CompletedBooksWidget({Key? key, required  this.books}) : super(key: key);

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {

    arrangeBooksByCompletionDate();

    return Padding(
      padding: const CustomPadding(horizontal: 30, vertical: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const CustomPadding(horizontal: 12),
            child: TextInriaSans("Completed Books", size: 20,),
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

            child: MyGroupedList.grid(
              shrinkWrap: true,
              crossAxisCount: 3,
              items: books,
              sortBy: (element){
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
                  return TextInriaSans(
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


  void arrangeBooksByCompletionDate(){
    books.sort((b,a) {
      return a.completeDate!.compareTo(b.completeDate!);
    });
  }
}
