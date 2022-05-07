
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedInPage extends StatefulWidget {
  const LoggedInPage({Key? key}) : super(key: key);

  @override
  State<LoggedInPage> createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {

  var email1 = '';
  var pass1 = '';
  @override
  void initState() {
    readList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Column(
        children: [
          Text(email1),
          Text(pass1)
        ],
      ),
    );
  }
  
  
  
  readList() async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final String email = prefs.getString('Email')??"";
    final String password = prefs.getString('Pass')??"";
    setState(() {
      email1 = email;
      pass1 = password;
    });
  }
}
