import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../managers/state_manager/bright_mode_provider.dart';
import '../../../../managers/state_manager/page_filter_provider.dart';


class ColorPicker{
  //static const Color accent =  Color.fromRGBO(56, 56, 56, 1);
  static const Color onDarkForeground =  Colors.white24;
  static const Color onBrightForeground =  Colors.black12;

  static PopupMenuEntry<int> list(WidgetRef ref) {

    final isBright = ref.watch(brightModeProvider);

    final Color chosenColor = isBright ? onBrightForeground : onDarkForeground;

    return PopupMenuItem<int>(
      enabled: false, //not interactive
      value: 2,

      child: Column(
        children: [

          divider(chosenColor),

          Container(
            decoration: BoxDecoration(
                color: chosenColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

            child: colorIconList(ref),
          ),
        ],
      ),
    );
  }


  static Widget divider(Color chosenColor){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Divider(color: chosenColor, thickness: 2,),
    );
  }


  static Widget colorIconList(WidgetRef ref){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        colorIcon(
          index: 0,
          color: colorNormalPage,
          onTap: (){
            ref.read(pageFilterProvider.notifier).changeIndex(0);
            ref.read(brightModeProvider.notifier).brightMode();
          },),

        colorIcon(
          index: 1,
          color: colorGreyedLook,
          onTap: () {
            ref.read(pageFilterProvider.notifier).changeIndex(1);
            ref.read(brightModeProvider.notifier).brightMode();
          },),

        colorIcon(
          index: 2,
          color: colorEyeCare,
          onTap: () {
            ref.read(pageFilterProvider.notifier).changeIndex(2);
            ref.read(brightModeProvider.notifier).darkMode();
          },),

        colorIcon(
          index: 3,
          color: colorDarkPage,
          onTap: (){
            ref.read(pageFilterProvider.notifier).changeIndex(3);
            ref.read(brightModeProvider.notifier).darkMode();
          },),

      ],
    );
  }


  static Widget colorIcon({required Function() onTap, required Color color, required int index}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),

      child: InkWell(
        onTap: onTap,

        child: Consumer(
          builder: (context,ref,_) {
            final chosenIndex = ref.watch(pageFilterProvider);

            return Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: chosenIndex == index ? Border.all(width: 4) : Border.all(width: 1, color: Colors.black26)
              ),
            );
          },
        ),
      ),
    );

  }
}
