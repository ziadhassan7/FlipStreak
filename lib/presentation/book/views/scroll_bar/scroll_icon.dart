import 'package:flip_streak/business/vibration_util.dart';
import 'package:flip_streak/presentation/book/views/scroll_bar/scroll_bar.dart';
import 'package:flip_streak/presentation/styles/device_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../business/app_wise/controllers/scroll_controller.dart';
import '../../../../provider/scroll_page_indicator_provider.dart';
import '../../../../provider/scroll_view_provider.dart';
import '../../../styles/box_decoration.dart';

class ScrollIcon extends ConsumerWidget {
  const ScrollIcon({Key? key}) : super(key: key);

  //if user scrolls using indicator not pages
  static bool rapidScroll = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    double screenHeight = DeviceScreen(context).height;

    return GestureDetector(
      onPanDown: (det){
        ref.read(scrollPagesIndicatorProvider.notifier).show();
      },

      onPanUpdate: (det){

        double minScreenLimit = 80;
        double maxScreenLimit = screenHeight - CustomScrollBar.limit;
        double position = det.globalPosition.dy;

        // move position unless it reaches screen limits
        if (minScreenLimit < position && position < maxScreenLimit) {

          ref.read(scrollViewPositionProvider.notifier)
              .updateWithPosition(context, det.globalPosition.dy, minScreenLimit, maxScreenLimit);

          //user is rapid scrolling (true)
          ScrollBehaviourController.toggleRapidScroll();

          VibrationUtil.resetTrigger();

        } else {
          //if it reached, then vibrate
          VibrationUtil.vibrate();
        }
      },

      onPanEnd: (det){
        ref.read(scrollPagesIndicatorProvider.notifier).hide();

        //user is done rapid scrolling(false)
        ScrollBehaviourController.disableRapidScroll();
      },

      child: Container(
        decoration: CustomDecoration(
            backgroundColor: Colors.black26,
            radius: 30),

        height: 40, width: 21,
      ),
    );
  }
}
