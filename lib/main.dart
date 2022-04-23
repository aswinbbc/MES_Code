import 'package:flutter/material.dart';
import 'package:untitled8/abc.dart';
import 'package:untitled8/http_sample.dart';
import 'package:untitled8/list_sample.dart';
import 'package:untitled8/todo.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Todo(),
    );
  }
}
