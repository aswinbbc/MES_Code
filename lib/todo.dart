import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var data = 'loading';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        loadData();
        },
      child:
        Icon(Icons.add)
        ,),
      body: Center(child: Text(data),),
    );
  }
  loadData() async{
var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
var result = await http.get(url);
setState(() {
  data = result.body;
});

  }
}
