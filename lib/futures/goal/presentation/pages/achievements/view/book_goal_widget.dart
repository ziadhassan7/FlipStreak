import 'package:flip_streak/futures/goal/presentation/managers/state_manager/books_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../dialog/edit_books_goal/edit_books_goal.dart';
import '../widget/goal_widget.dart';

class BookGoalWidget extends ConsumerWidget {
  const BookGoalWidget({Key? key, required this.completedBooks}) : super(key: key);

  final int completedBooks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final goal = ref.watch(booksGoalProvider);


    return GoalWidget(
        title: "Books' Goal",
        info: "Books read",
        infoTail: "this year.",

        currentProgress: completedBooks,
        goal: goal,

        onEditPress: (){
          EditBooksGoal(context, ref);
        },

        showTotalPagesCount: true,
    );
  }

}
