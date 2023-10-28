import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../../futures/books/data/local_db/book_client.dart';


class FileUtility {

  static Future<String> getAppPath() async {
    Directory? directory = await getExternalStorageDirectory();
    return directory!.path;
    //return (await getApplicationDocumentsDirectory()).path;
  }

  static Future<String> copyFile(File sourceFile, /*String dist*/) async {
    String dist = await getAppPath();
    String bookName = basename(sourceFile.path);
    String newPath = '$dist/$bookName';

    final newFile = await sourceFile.copy(newPath);
    return newFile.path;
  }

  static Future<File> moveFile(File sourceFile, /*String dist*/) async {
    String dist = await getAppPath();
    String bookName = basename(sourceFile.path);
    String newPath = '$dist/$bookName';

    try {
      // prefer using rename as it is probably faster
      return await sourceFile.rename(newPath);
    } on FileSystemException {
      // if rename fails, copy the source file and then delete it
      final newFile = await sourceFile.copy(newPath);
      await sourceFile.delete();
      return newFile;
    }
  }


  static Future<bool> deleteFile(String fileName) async {
    BookClient bookClient = BookClient.instance;
    String dist = await getAppPath();
    String filePath = '$dist/$fileName';
    File file = File(filePath);

    try {

      await file.delete();
      bookClient.deleteItem(fileName);

      return true;
    } catch (e) {
      return false;
    }
  }
}