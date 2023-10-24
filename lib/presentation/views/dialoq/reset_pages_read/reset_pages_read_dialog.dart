import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/views/dialoq/dialoq_widget.dart';
import 'package:flip_streak/provider/pages_read_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../text_inria_sans.dart';


class ResetPagesReadDialog {

  final BuildContext context;
  final WidgetRef ref;

  ResetPagesReadDialog( this.context, this.ref,) {


    DialogWidget(
        context,
        dominantButtonTitle: "Reset",
        dominantButtonColor: Colors.red,

        dominantButtonFunction: (){
          ref.read(pagesReadProvider.notifier).reset();
        },

        child: TextInriaSans("Reset your progress?", weight: FontWeight.bold, color: colorDark,)

    ).showStandardDialog();
  }

}