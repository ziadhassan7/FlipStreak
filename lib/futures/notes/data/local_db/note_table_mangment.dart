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

    /*

    //If you want to change column data-type
    //There is no (alter column) nor (drop column) command in sqlite
    //
    //You have to:
    //Alter Table Rename (table) to (table_temp)
    //Create new Table with your intended data-types
    //Select data from (table_temp) into (new_table)
    //DROP TABLE table_temp;
    //
    //https://stackoverflow.com/a/4007086/9242141
    //https://www.sqlitetutorial.net/sqlite-alter-table/

    //rename old table to temp
    await db.execute('''
      ALTER TABLE table RENAME TO table_temp;
      ''');

    //new_table
    await db.execute('''
      CREATE TABLE table (
        col_a INT
      , col_b INT
      );
      ''');

    //insert from old into new_table
    await db.execute('''
      INSERT INTO table(col_a, col_b)
      SELECT col_a, colb
      FROM table_temp;
      ''');

    //delete temp
    await db.execute('''
      DROP TABLE table_temp;
      ''');

    */
  }

}