
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled8/LoggedInPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  var email = TextEditingController();
  var password = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: email,
            ),
            SizedBox(height: 15),
            TextField(obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: password,
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: (){
              saveList();
            }, child: Text("Login")) ],
        ),
      ),
    );
  }
  saveList() async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Email', email.text);
    await prefs.setString('Pass', password.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoggedInPage()),
    );

  }
}
