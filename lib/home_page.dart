
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("my count is $count"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: click,),
    );
  }

  void click(){
    setState(() {
      count++;
    });
  }
}