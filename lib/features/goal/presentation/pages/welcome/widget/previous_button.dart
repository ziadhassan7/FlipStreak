import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../managers/state_manager/welcome_screen_provider.dart';

class PreviousButton extends ConsumerWidget {
  const PreviousButton(this. currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed:
      (currentPage != Pages.firstPage)
          ? ()=> previousButtonPressed(context, ref, currentPage)
          : null,

      child: TextView(
        "Previous",
        color: (currentPage != Pages.firstPage) ? Colors.black54 : Colors.black26,
        weight: FontWeight.bold,
        size: 18,
      ),
    );
  }

  /// Previous
  previousButtonPressed(BuildContext context, WidgetRef ref, Pages currentPage){

    List pages = Pages.values;

    if(currentPage != Pages.firstPage){
      ref.read(welcomeScreenProvider.notifier).changeIndex(pages[currentPage.index -1]);
    }
  }

}
