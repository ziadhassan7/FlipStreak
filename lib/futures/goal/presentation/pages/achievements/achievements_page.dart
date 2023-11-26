import 'package:flip_streak/futures/books/presentation/managers/controllers/book_controller.dart';
import 'package:flip_streak/futures/books/presentation/managers/state_manager/book_list_provider.dart';
import 'package:flip_streak/futures/goal/presentation/pages/achievements/view/today_goal_widget.dart';
import 'package:flip_streak/futures/goal/presentation/pages/achievements/view/top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/color_constants.dart';
import '../../../../books/data/model/book_model.dart';
import 'view/book_goal_widget.dart';
import 'view/completed_books_view.dart';

class AchievementsPage extends ConsumerWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final Future<List<BookModel>> books = ref.watch(bookListProvider);

    return Scaffold(
      backgroundColor: colorPrimary.withOpacity(0.4),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AchievementTopWidget(),

              const TodayGoalWidget(),


              FutureBuilder(
                future: getCompletedBooks(books),
                builder: (context, AsyncSnapshot snapshot) {


                  if(snapshot.hasData){

                    return snapshot.data!.isNotEmpty
                        ? Column(
                            children: [
                              BookGoalWidget(completedBooks: getCompletedThisYear(snapshot.data!).length,),

                              CompletedBooksWidget(books: snapshot.data!)
                            ],
                          )

                        : const BookGoalWidget(completedBooks: 0,);

                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }
              )
            ],
          ),
        ),
      )
    );
  }

  Future<List<BookModel>> getCompletedBooks(Future<List<BookModel>> providerBooks) async {
    final List<BookModel> allBooks = await providerBooks;

    return getCompletedOnly(allBooks);
  }


  getCompletedThisYear(List<BookModel> allCompletedBooks){

    int currentYear = DateTime.now().year;
    List<BookModel> completedBooksThisYear = [];

    for(var book in allCompletedBooks){
      //check if book is completed this year
      int completedYear = DateTime.parse(book.completeDate!).year;
      if(completedYear == currentYear){
        completedBooksThisYear.add(book);
      }
    }

    return completedBooksThisYear;
  }
}
