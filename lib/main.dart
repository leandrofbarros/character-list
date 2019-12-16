import 'package:character_list/view/list/custom_list_view.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Project Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomListView(),
    );
  }
}