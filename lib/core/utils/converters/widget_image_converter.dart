import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import '../../../features/notes/presentation/manager/controller/note_controller.dart';

class WidgetImageConverter {

  static Future<Uint8List> getWidgetAsPng(GlobalKey widgetKey) async {
    RenderRepaintBoundary boundary = widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
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