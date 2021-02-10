///Authors: Phil D.
///Purpose: To provide the project with necessary databases
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
        //
        join(await getDatabasesPath(), 'fitu.db'),
        onCreate: (db, version) async {
      //SQL code goes here.
      await db.execute('''
        
        ''');
    });
  }
}
