import 'package:flip_streak/core/utils/share_util.dart';
import 'package:flutter/services.dart';
import '../../../../../core/utils/converters/widget_image_converter.dart';
import '../../pages/note_share/view/share_item.dart';

class NoteShareController {

  static share() async {
    await ShareUtil.shareImage(await _getNoteImage());
  }

  static Future<Uint8List> _getNoteImage() async
  =>  await WidgetImageConverter.getWidgetAsPng(ShareItem.shareWidgetKey);


}