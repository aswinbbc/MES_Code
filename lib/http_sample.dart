import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpSample extends StatefulWidget {
  const HttpSample({Key? key}) : super(key: key);

  @override
  State<HttpSample> createState() => _HttpSampleState();
}

class _HttpSampleState extends State<HttpSample> {
  String data = "loading..";

  @override
  initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(data)),
    );
  }

  loadData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var result = await http.get(url);
    setState(() {
      data = result.body;
    });
  }
}
