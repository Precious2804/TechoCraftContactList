import 'package:contact_list_app/models/contact.dart';
import 'package:contact_list_app/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEditContact extends StatelessWidget {
  final Contact contactEdit;
  final int index;
  CreateEditContact({this.contactEdit, this.index});

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  void initPage(){
    if (contactEdit!= null){
      fNameController.text = contactEdit.fName;
      lNameController.text = contactEdit.lName;
      phoneController.text = contactEdit.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    initPage();
    return Scaffold(
      appBar: AppBar(
        title: Text(contactEdit!= null?'Edit Contact':'Create Contact'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: fNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Enter first Name'
                ),
                keyboardType: TextInputType.name,
                validator: (String value){
                  if (value.isEmpty){
                    return 'First Name is Required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lNameController,
                decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Enter Last Name'
                ),
                keyboardType: TextInputType.name,
                validator: (String value){
                  if (value.isEmpty){
                    return 'Last Name is Required';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter Phone Number'
                ),
                keyboardType: TextInputType.phone,
                validator: (String value){
                  if (value.isEmpty){
                    return 'Phone Number is Required';
                  }
                  return null;
                },
              ),

              ElevatedButton(
                  onPressed: (){
                    if (formKey.currentState.validate()){
                      Contact contact = new Contact(
                        fName: fNameController.text,
                        lName: lNameController.text,
                        phone: phoneController.text,
                      );

                      if(contactEdit!=null){
                        Provider.of<ContactProvider>(context, listen: false).editContact(contact, index);
                      } else{
                      Provider.of<ContactProvider>(context, listen: false).addContact(contact);
                    }
                      Navigator.pop(context);
                    }
              }, child: SizedBox(width: double.infinity, child: Text('Save Contact', textAlign: TextAlign.center,)))

            ],
          ),
        ),
      )
    );
  }
}
