import 'package:sqflite/sqflite.dart';
import '../../../../core/constants/db_constants/general_config.dart';
import 'package:flip_streak/core/constants/db_constants/note_db_constants.dart';


class NoteTable {

  static create(Database database) async {
    await database.execute('''  
    CREATE TABLE $tableNote (
    $columnNoteId $textType,
    $columnNoteTitle $textType,
    $columnNoteBody $textType,
    $columnNotePage $textType,
    $columnNoteBookName $textType
    )
    ''');
  }

  static upgrade(Database db, int oldVersion, int newVersion) async {

    //Migrate from version...
    /*if (oldVersion == 14) {
      await db.execute('''
      ALTER TABLE $tableNote
      ADD COLUMN $columnThumbnail $textType;
      ''');
    }*/
  }

}