import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static const String DB_NAME = "antiseptic.db";
  static const String ANTISEPTICS_TABLE = "Antiseptics";

  static const String CREATE_ANTISEPTIC_TABLE =
      "CREATE TABLE $ANTISEPTICS_TABLE("
      "id INTEGER PRIMARY KEY,"
      "name TEXT"
      ")";

  static final DatabaseProvider db = DatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, DB_NAME);
    return await openDatabase(path, version: 1, onOpen: (db) async {
      await db.execute(CREATE_ANTISEPTIC_TABLE);
    });
  }
}
