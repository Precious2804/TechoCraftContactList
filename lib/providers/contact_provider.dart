import 'package:contact_list_app/database/database_handlers.dart';
import 'package:contact_list_app/models/contact.dart';
import 'package:flutter/foundation.dart';

class ContactProvider extends ChangeNotifier {

  DatabaseHandler handler = new DatabaseHandler();
  List<Contact> _contacts = [];

  void addContact(Contact contact){
   // _contacts.add(contact);
    handler.insertContact(contact);
    getAllContacts();
  }

  void deleteContact (Contact contact){
  handler.deleteContact(contact.id);
  getAllContacts();
  }

  void getAllContacts()async{
    _contacts.clear();
    _contacts.addAll(await handler.getContact());
    notifyListeners();
  }

  List<Contact> getContacts(){
    return _contacts..sort((a,b) =>a.fName.compareTo(b.fName));
  }

  void editContact (Contact contact){
    handler.upDateContact(contact);
    getAllContacts();
  }
}