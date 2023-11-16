import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../../futures/books/data/local_db/book_client.dart';


class FileUtil {

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

  static bool renameFile(File file, String newFileName){
    //get new path
    String dir = dirname(file.path);
    String newPath = join(dir, '$newFileName.pdf');

    //rename
    try {
      file.renameSync(newPath); //you can use rename() which is asynchronous (await)
      return true;

    } catch (e) {
      return false;
    }
  }


  static Future<bool> deleteFile(String fileName, String filePath) async {
    BookClient bookClient = BookClient.instance;
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