import 'package:flip_streak/business/share_util.dart';
import 'package:flip_streak/presentation/notes/presentation/manager/controller/note_controller.dart';
import 'package:flip_streak/presentation/notes/presentation/pages/note_share/view/share_item.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class NoteShareController {

  static share() async {
    ShareUtil.shareImage(await _getSharedImage());
  }

  static Future<Uint8List> _getSharedImage() async {
    RenderRepaintBoundary boundary = ShareItem.shareWidgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: _getProperResolution()); //pixelRatio for quality
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    return pngBytes;
  }

  static double _getProperResolution(){
    //if note length is too big
    if(NoteController.noteBody.text.length > 200){
      return 8; //big widget

    } else {
      return 4.5;//small widget
    }
  }

}