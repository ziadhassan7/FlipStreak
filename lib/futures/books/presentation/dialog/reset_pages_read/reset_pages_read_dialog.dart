import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/app_common_views/z_dialog/z_dialog.dart';
import 'package:flip_streak/futures/goal/presentation/managers/state_manager/pages_read_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_views/text_view/text_view.dart';


class ResetPagesReadDialog {

  final BuildContext context;
  final WidgetRef ref;

  ResetPagesReadDialog( this.context, this.ref,) {


    ZDialog(
        context,
        dominantButtonTitle: "Reset",
        dominantButtonColor: Colors.red,

        dominantButtonFunction: (){
          ref.read(pagesReadProvider.notifier).reset();
        },

        child: const TextView("Reset your progress?", weight: FontWeight.bold, color: colorDark,)

    ).showStandardDialog();
  }

}