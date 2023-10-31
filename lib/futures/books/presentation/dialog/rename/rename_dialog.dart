import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/app_common_views/z_dialog/z_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_views/text_view/text_view.dart';


class RenameDialog {

  final BuildContext context;
  final WidgetRef ref;

  RenameDialog( this.context, this.ref,) {


    ZDialog(
        context,
        dominantButtonTitle: "Save",
        dominantButtonColor: colorAccent,

        dominantButtonFunction: (){

        },

        child: view()

    );
  }


  Widget view(){
    return Column(
      children: [
        TextView("Enter new name"),


      ],
    );
  }

}