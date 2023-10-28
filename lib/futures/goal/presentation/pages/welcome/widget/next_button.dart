import 'package:flip_streak/futures/goal/presentation/managers/state_manager/pages_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/app_router.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/shared_pref/hive_client.dart';
import '../../../../../../index_page/index_page.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../managers/state_manager/books_goal_provider.dart';
import '../../../managers/state_manager/welcome_screen_provider.dart';

class NextButton extends ConsumerWidget {
  const NextButton(this.currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String text = (currentPage == Pages.thirdPage) ? "Finish" : "Next";

    return TextButton(
      onPressed: ()=> nextButtonPressed(context, ref, currentPage),

      child: TextView(
        text,
        color: colorAccent,
        weight: FontWeight.bold,
        size: 18,
      ),
    );
  }

  /// Next
  nextButtonPressed(BuildContext context, WidgetRef ref, Pages currentPage){
    HiveClient hiveClient = HiveClient();

    switch(currentPage){

      case Pages.firstPage:
        //Save Pages' Goal
        int pagesGoal = ref.watch(pagesGoalProvider);
        hiveClient.updatePagesGoal(pagesGoal);
        //Move to Books' Goal Page
        ref.read(welcomeScreenProvider.notifier).changeIndex(Pages.secondPage);
        break;

      case Pages.secondPage:
        //Save Books' Goal
        int booksGoal = ref.watch(booksGoalProvider);
        hiveClient.updateBooksGoal(booksGoal);
        //Move to Notification Page
        ref.read(welcomeScreenProvider.notifier).changeIndex(Pages.thirdPage);
        break;

      case Pages.thirdPage:
        //Navigate to Home Page
        AppRouter.navigateTo(context, IndexPage(), isReplace: true);
        //App First Open: false
        hiveClient.updateFirstOpenState();
        break;
    }
  }

}
