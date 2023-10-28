import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../widget/note_box.dart';
import '../widget/page_indicator.dart';

class ShareItem extends ConsumerWidget {
  const ShareItem({Key? key,}) : super(key: key);

  static final GlobalKey shareWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return RepaintBoundary(
      key: shareWidgetKey,

      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [colorAccent, Colors.black,],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2 , 1.0],
          ),
        ),

        child: const Padding(
          padding: CustomPadding(horizontal: 18, vertical: 32),

          child: Column(
            children: [
              Stack(
                children: [
                  /// Note
                  NoteBox(),

                  /// Pg.
                  PageIndicator(),
                ],
              ),


              /// Brand Identity
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: CustomPadding(horizontal: 12, vertical: 4),
                    child: TextView(
                      "Shared from FlipStreak",
                      color: Colors.white38, //colorOrange.withOpacity(0.6)
                      size: 12,),
                  ))
            ],
          ),
        ),
      ),
    );
  }


}
