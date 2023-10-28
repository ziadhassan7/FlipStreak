import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../managers/state_manager/welcome_screen_provider.dart';
import '../widget/navigation_indicator.dart';
import '../widget/next_button.dart';
import '../widget/previous_button.dart';

class NavigationWidget extends ConsumerWidget {
  const NavigationWidget(this.currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        color: colorAccent.withOpacity(0.1),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            //Previous
            PreviousButton(currentPage,),

            //Dots
            NavigationDots(currentPage),

            //Next
            NextButton(currentPage,),
          ],
        ),
      ),
    );
  }

}
