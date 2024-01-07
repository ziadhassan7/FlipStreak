import 'package:sqflite/sqflite.dart';
import '../../../../core/constants/db_constants/general_config.dart';
import '../../../../core/constants/db_constants/book_db_constanst.dart';


class BookTable {

  static create(Database db) async {
    await db.execute('''  
    CREATE TABLE $tableBook (
    $columnBookId $textType,
    $columnPath $textType,
    $columnThumbnail $textType,
    $columnBookmark $textType,
    $columnLastPage $intType,
    $columnTotalPages $intType,
    $columnCategory $textType,
    $columnAddDate $textType,
    $columnCompleteDate $textType,
    $columnIsComplete $intType,
    $columnLastReadDate $textType
    )
    ''');
  }

  static upgrade(Database db, int oldVersion, int newVersion) async {

    //Migrate from version...

    ///Migrate from version 14 or older
    //(Adding a new column)
    if (oldVersion <= 14) {
      await db.execute('''
      ALTER TABLE $tableBook
      ADD COLUMN $columnThumbnail $textType;
      ''');
    }
  }

}