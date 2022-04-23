import 'package:flutter/material.dart';

class ColorChanging extends StatefulWidget {
  ColorChanging({Key? key}) : super(key: key);

  @override
  State<ColorChanging> createState() => _ColorChangingState();
}

class _ColorChangingState extends State<ColorChanging> {
  var color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Colors"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = Colors.green;
                    });
                  },
                  child: Text("green")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = Colors.red;
                    });
                  },
                  child: Text("red")),
            ],
          ),
          Container(
            height: 250,
            width: 250,
            color: color,
          )
        ],
      ),
    );
  }
}
