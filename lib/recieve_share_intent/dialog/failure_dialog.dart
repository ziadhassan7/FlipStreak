import 'package:flip_streak/features/app_common_views/z_dialog/z_dialog.dart';
import 'package:flip_streak/recieve_share_intent/dialog/view/status_view.dart';
import 'package:flutter/material.dart';


class FailureDialog {

  FailureDialog(BuildContext context){
    ZDialog.info(
      context,

      child: const StatusView(
        message: "Failure",
        illustration: "assets/illustrations/exclamation.svg",
      ),
    );
  }
}
