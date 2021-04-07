import 'package:contact_list_app/models/contact.dart';
import 'package:flutter/foundation.dart';

class ContactProvider extends ChangeNotifier {

  List<Contact> _contacts = [];

  void addContact(Contact contact){
    _contacts.add(contact);
    notifyListeners();
  }

  void deleteContact (Contact contact){
    _contacts.remove(contact);
    notifyListeners();
  }

  List<Contact> getContacts(){
    return _contacts..sort((a,b) =>a.fName.compareTo(b.fName));
  }

  void editContact (Contact contact, int index){
    _contacts[index] = contact;
    notifyListeners();
  }
}