import 'package:flutter/material.dart';
import 'package:untitled8/main.dart';
import 'package:untitled8/todo.dart';

class multiTable extends StatefulWidget {
  const multiTable({Key? key}) : super(key: key);

  @override
  State<multiTable> createState() => _multiTableState();
}

class _multiTableState extends State<multiTable> {
  String data = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Todo()),
        );
      }, icon: Icon(Icons.list))],
        title: Text('Multiplication table'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: ListView.builder(itemCount: 100,
                itemBuilder: (context, index) {
              var result = int.parse(data) * (index+1);
              return ListTile(
                title: Text("$data * ${index+1} = $result"),
              );
            }),
          ),
          Expanded(child: TextField(
            onChanged: (value) {
              setState(() {
                if (double.tryParse(value) != null)
                  data = value;
                else
                  data = "0";
              });
            },
          )),
        ],
      ),
    );
  }
}
