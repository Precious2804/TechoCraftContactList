import 'package:contact_list_app/contact_list_page.dart';
import 'package:contact_list_app/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(MyApp());

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>ContactProvider())
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListPage(),
    );
  }
}
