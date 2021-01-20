import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Creative Developers"),
        ),
        body: Center(
          child: Container(
            child: Text(
              "Hello Creators,\n\nWelcome to Creative \nDevelopers Homepage",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[500]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
