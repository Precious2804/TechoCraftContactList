

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class ContactDB{
  static Database _database;
  static const String _DATABASE_NAME = 'contacts.db';
  static const int _DATABASE_VERSION = 1;

  static const String TABLE_NAME = 'ContactsTable';
  static const String COLUMN_ID = 'id';
  static const String COLUMN_F_NAME = 'fName';
  static const String COLUMN_L_NAME = 'lName';
  static const String COLUMN_PHONE = 'phone';

  static const String _CREATE_TABLE = "CREATE TABLE "
      "$TABLE_NAME("
      "$COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$COLUMN_F_NAME TEXT,"
      "$COLUMN_L_NAME TEXT,"
      "$COLUMN_PHONE TEXT"
      ")";

  Future<Database>get database  async{
    if (_database != null){
      return _database;}

    _database = await initDB();
    return _database;
  }


  initDB()async{
    Directory directory  = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _DATABASE_NAME);
    return await openDatabase(path,version: _DATABASE_VERSION,onOpen: (db){

    }, onCreate: (Database db, int version)async{
      await db.execute(_CREATE_TABLE);
    });
  }

}