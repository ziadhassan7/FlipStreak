import 'package:flip_streak/business/share_util.dart';
import 'package:flip_streak/presentation/notes/presentation/pages/note_share/widget/share_item.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class NoteShareController {

  static share() async {
    ShareUtil.shareImage(await _getSharedImage());
  }

  static Future<Uint8List> _getSharedImage() async {
    RenderRepaintBoundary boundary = ShareItem.shareWidgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    return pngBytes;
  }


}