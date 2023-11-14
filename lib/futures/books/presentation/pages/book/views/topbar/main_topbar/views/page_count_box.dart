import 'package:flip_streak/futures/confetti/binding/confetti_lamp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../../../core/styles/padding.dart';
import '../../../../../../../../confetti/state_manager/confetti_lamp_provider.dart';
import '../../../../../../../../goal/presentation/managers/state_manager/pages_read_provider.dart';
import '../../../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../../dialog/lamp_info/lamp_info_dialog.dart';
import '../../../../../../managers/state_manager/bright_mode_provider.dart';
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

    //celebrate reaching goal
    WidgetsBinding.instance.addPostFrameCallback((_) => shouldShowConfetti(ref));

    return Stack(
      children: [

        /// Confetti - Congratulations
        const Padding(
          padding: CustomPadding(left: 20),
          child: ConfettiLampPage(),
        ),

        /// Lamp Widget
        InkWell(

          onTap: ()=> LampInfoDialog(context, ref, _pagesRead, _pagesGoal),

          child: Container(
            decoration: BoxDecoration(
                color: _backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(15))
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getIconIndicator(),

                TextView("$_pagesRead/$_pagesGoal", color: _foregroundColor, weight: FontWeight.bold, size: 12,),
              ],
            ),
          ),
        ),
      ],
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

  static shouldShowConfetti(WidgetRef ref){

    if(_pagesRead == _pagesGoal){
      ref.read(confettiLampProvider.notifier).showConfetti();

    } else {
      ref.read(confettiLampProvider.notifier).hideConfetti();
    }
  }
}
