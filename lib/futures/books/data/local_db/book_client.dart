import 'package:flip_streak/core/sql_client.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../core/constants/db_constants/book_db_constanst.dart';
import '../model/book_model.dart';

class BookClient {

  static final BookClient instance = BookClient._init();

  BookClient._init();

/// Create
  Future<void> createItem(BookModel bookModel) async {
    final db = await SqlClient.instance.database;

    try{
      db!.insert(
        tableBook,
        bookModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Sql insert");
    } catch (e) {
      print("Sql error");
    }
  }

/// Update
  Future<void> updateItem(BookModel bookModel) async {
    final db = await SqlClient.instance.database;

    db!.update(
      tableBook,
      bookModel.toMap(),
      where: '$columnBookId = ?',
      whereArgs: [bookModel.id],
    );
  }

/// Delete
  Future<void> deleteItem(String? id) async {
    final db = await SqlClient.instance.database;

    db!.delete(
      tableBook,
      where: '$columnBookId = ?',
      whereArgs: [id],
    );
  }

/// Delete
  Future<void> deleteAllItem() async {
    final db = await SqlClient.instance.database;

    db!.delete(
      tableBook,
    );
  }


// Read One Element
  Future<BookModel> readOneElement(String? id) async {
    final db = await SqlClient.instance.database;

    final data = await db!.query(
      tableBook,
      where: '$columnBookId = ?',
      whereArgs: [id],
    );

    return data.isNotEmpty
        ? BookModel.fromMap(data.first)
        : throw Exception('There is no data');
  }


// Read All Elements
  Future<List<BookModel>> readAllElements() async {
    final db = await SqlClient.instance.database;

    final data = await db!.query(tableBook);

    return data.isNotEmpty
        ? data.map((item) => BookModel.fromMap(item)).toList()
        : [];
  }

}