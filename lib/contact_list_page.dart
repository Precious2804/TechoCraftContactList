import 'package:contact_list_app/create_edit_contact.dart';
import 'package:contact_list_app/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Contacts'),
        centerTitle: true,
      ),
      body: Consumer<ContactProvider>(builder: (BuildContext context, ContactProvider contacts, Widget child){
        if(contacts.getContacts().isEmpty){
          contacts.getAllContacts();
        }
        if (contacts.getContacts().isNotEmpty)
        return ListView.builder(
            itemCount: contacts.getContacts().length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text('${contacts.getContacts()[index].fName} ${contacts.getContacts()[index].lName}'),
                subtitle: Text('${contacts.getContacts()[index].phone}'),
                leading: Icon(Icons.person),
                trailing: Wrap(
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: (){
                        contacts.deleteContact(contacts.getContacts()[index]);
                      },

                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.green),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>CreateEditContact(contactEdit: contacts.getContacts()[index], index: index)));
                      },

                    ),

                  ],
                )
              );
        });
        else
          return Center(
            child: Text('Empty! Please Add Contact'),
          );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>CreateEditContact()));
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
