import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  void initState() {
    readList();
    super.initState();
  }
  var data = 'loading';
  List<String> toDoItems = [];
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTile();
          saveList();
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: toDoItems.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text(toDoItems[index]),
                subtitle: Text("Subtitle"),
                trailing: Text("Time"),
              ),
            ),
          ),
          Expanded(flex: 1,
              child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 55, 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal))),
              controller: myController,
            ),
          ))
        ],
      ),
    );
  }

  addTile() {
    setState(() {
      toDoItems.add(myController.text);
    });
    myController.clear();
  }

  saveList() async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', toDoItems);
  }

  readList() async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList('items')??[];
    setState(() {
      toDoItems = items;
    });
  }
}
