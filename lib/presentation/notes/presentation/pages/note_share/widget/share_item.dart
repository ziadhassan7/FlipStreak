import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/notes/presentation/pages/note_item/widget/note_box.dart';
import 'package:flip_streak/presentation/notes/presentation/pages/note_item/widget/page_indicator.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  NoteBox(),

                  PageIndicator(),
                ],
              ),
              
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const CustomPadding(horizontal: 12, vertical: 4),
                    child: TextInriaSans("Shared from FlipStreak", color: colorOrange.withOpacity(0.6), size: 12,),
                  ))
            ],
          ),
        ),
      ),
    );
  }


}
