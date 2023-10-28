import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareUtil {

  static shareImage(Uint8List byteData) async {

    final directory = (await getExternalStorageDirectory())!.path;
    File imgFile = File('$directory/flip_streak_note.png');
    imgFile.writeAsBytes(byteData);

    XFile xFile = XFile(imgFile.path);
    await Share.shareXFiles([xFile]);
  }

}