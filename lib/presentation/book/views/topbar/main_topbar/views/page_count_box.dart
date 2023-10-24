import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../provider/bright_mode_provider.dart';
import '../../../../../../provider/pages_read_provider.dart';
import '../../../../../views/text_inria_sans.dart';
import '../controllers/page_count_box_controller.dart';

class PageCountBox extends ConsumerWidget {
  const PageCountBox({Key? key}) : super(key: key);

  static late Color _backgroundColor;
  static late Color _foregroundColor;

  static late String _pagesRead;
  static late String _pagesGoal;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isBright = ref.watch(brightModeProvider);
    _pagesRead = ref.watch(pagesReadProvider).toString();

    // Set Variables
    _backgroundColor = PageCountBoxController.getBackgroundColor(isBright);
    _foregroundColor = PageCountBoxController.getForegroundColor(isBright);
    _pagesGoal = PageCountBoxController.getPagesGoal().toString();

    return Container(
      decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getIconIndicator(),

          TextInriaSans("$_pagesRead/$_pagesGoal", color: _foregroundColor, weight: FontWeight.bold, size: 12,),
        ],
      ),
    );
  }

  /// Icon
  static Widget getIconIndicator(){
    bool isGoalReached = PageCountBoxController.isGoalReached();

    if(isGoalReached){
      return Icon(Icons.lightbulb, color: _foregroundColor,);

    } else {
      return Icon(Icons.lightbulb_outline_rounded, color: _foregroundColor,);
    }
  }
}
