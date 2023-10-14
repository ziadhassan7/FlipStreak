import 'package:flip_streak/business/share_util.dart';
import 'package:flip_streak/business/widget_image_converter.dart';
import 'package:flip_streak/presentation/notes/presentation/pages/note_share/view/share_item.dart';
import 'package:flutter/services.dart';

class NoteShareController {

  static share() async {
    await ShareUtil.shareImage(await _getNoteImage());
  }

  static Future<Uint8List> _getNoteImage() async
  =>  await WidgetImageConverter.getWidgetAsPng(ShareItem.shareWidgetKey);


}