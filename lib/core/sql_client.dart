import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'constants/db_constants/book_db_constanst.dart';
import 'constants/db_constants/general_config.dart';
import 'constants/db_constants/note_db_constants.dart';

class SqlClient {

  static final SqlClient instance = SqlClient._init();

  SqlClient._init();


  static Database? _database;

  Future<Database>? get database async{

    if(_database != null) _database;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async{
    String path = join(await getDatabasesPath(), 'BookDatabase.db');
    return await openDatabase(path, version: 12, onCreate: _createDB);
  }


  Future<void> _createDB(Database database, int version) async {
    // Book Table
    await database.execute('''  
    CREATE TABLE $tableBook (
    $columnBookId $textType,
    $columnPath $textType,
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

    // Note Table
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
}