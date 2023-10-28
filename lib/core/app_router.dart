import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AppRouter {

  /// Navigate to new screen
  static void navigateTo(BuildContext context, Widget screen, {bool isReplace = false}){
    if (isReplace) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );

    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }
  }


  /// Pick file
  static Future<List<PlatformFile>?> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
      allowMultiple: true,
    );

    List<PlatformFile>? filePath = result?.files;
    return filePath;
  }


}