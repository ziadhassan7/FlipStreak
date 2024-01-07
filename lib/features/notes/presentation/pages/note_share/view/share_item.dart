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

        child: Padding(
          padding: const CustomPadding(horizontal: 18, vertical: 32),

          child: Column(
            children: [
              const Stack(
                children: [
                  /// Note
                  NoteBox(),

                  /// Pg.
                  PageIndicator(),
                ],
              ),


              /// Brand Identity
              Padding(
                padding: const CustomPadding(horizontal: 12, vertical: 4),
                child: Row(
                  children: [
                    const Spacer(),

                    Image.asset("assets/app_icon/adaptive_icon.png", width: 24,),

                    const TextView(
                      "Shared from FlipStreak",
                      color: Colors.white70,
                      size: 12,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
