import 'package:flip_streak/features/app_common_views/z_dialog/z_dialog.dart';
import 'package:flip_streak/recieve_share_intent/dialog/view/status_view.dart';
import 'package:flutter/material.dart';
import 'manager/status_handler.dart';


class AlreadyAddedDialog {

  AlreadyAddedDialog(BuildContext context, String filePath){
    ZDialog(
      context,

      mainButtonTitle: "Open book",
      mainButtonFunction: () async {
        await StatusHandler().openBook(context, filePath);
      },

      child: const StatusView(
        message: "This book is already added",
        illustration: "assets/illustrations/smile.svg",
      ),
    );
  }

}
