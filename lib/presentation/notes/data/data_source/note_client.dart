import 'package:flip_streak/data/local_db/sql_client.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../app_constants/db_constants/note_db_constants.dart';
import '../model/note_model.dart';

class NoteClient {

  static final NoteClient instance = NoteClient._init();

  NoteClient._init();

  /// Create
  Future<void> createItem(NoteModel noteModel) async {
    final db = await SqlClient.instance.database;

    try{
      db!.insert(
        tableNote,
        noteModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      debugPrint("Sql insert");
    } catch (e) {
      debugPrint("Sql error");
    }
  }

  /// Update
  Future<void> updateItem(NoteModel noteModel) async {
    final db = await SqlClient.instance.database;

    db!.update(
      tableNote,
      noteModel.toMap(),
      where: '$columnNoteId = ?',
      whereArgs: [noteModel.noteId],
    );
  }

  /// Delete
  Future<void> deleteItem(String? id) async {
    final db = await SqlClient.instance.database;

    db!.delete(
      tableNote,
      where: '$columnNoteId = ?',
      whereArgs: [id],
    );
  }

  /// Delete
  Future<void> deleteAllItem() async {
    final db = await SqlClient.instance.database;

    db!.delete(
      tableNote,
    );
  }


// Read One Element
  Future<NoteModel> readOneElement(String? id) async {
    final db = await SqlClient.instance.database;

    final data = await db!.query(
      tableNote,
      where: '$columnNoteId = ?',
      whereArgs: [id],
    );

    return data.isNotEmpty
        ? NoteModel.fromMap(data.first)
        : throw Exception('There is no data');
  }


// Read All Elements
  Future<List<NoteModel>> readAllElements() async {
    final db = await SqlClient.instance.database;

    final data = await db!.query(tableNote);

    return data.isNotEmpty
        ? data.map((item) => NoteModel.fromMap(item)).toList()
        : [];
  }

}