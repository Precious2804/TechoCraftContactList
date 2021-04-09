import 'package:contact_list_app/database/contact_db.dart';
import 'package:contact_list_app/models/contact.dart';
import 'dart:async';

class DatabaseHandler {
  static ContactDB _contactDB;

  DatabaseHandler() {
    _contactDB = new ContactDB();
  }

  Future insertContact(Contact contact)async{
    final db = await _contactDB.database;
    final res = await db.insert(ContactDB.TABLE_NAME, contact.toMap());
    return res;
  }

  Future deleteContact(int id)async{
    final db = await _contactDB.database;
    db.delete(ContactDB.TABLE_NAME, where: '${ContactDB.COLUMN_ID}=?',whereArgs:[id]);
  }

  Future upDateContact(Contact contact)async{
    final db = await _contactDB.database;
    final res = await db.update(ContactDB.TABLE_NAME, contact.toMap(),where: '${ContactDB.COLUMN_ID}=?',
    whereArgs: [contact.id]);
    return res;
  }

  Future<List<Contact>> getContact() async{
    final db = await _contactDB.database;
    final res = await db.query(ContactDB.TABLE_NAME);
    List <Contact> contacts  = res.isNotEmpty?res.map((e) => Contact.fromMap(e)).toList():[];
    return contacts;
  }

}
