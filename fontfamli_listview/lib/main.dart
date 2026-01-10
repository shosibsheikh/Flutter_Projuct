import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'RubikGemstones',
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Form"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                "Box Blue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.greenAccent,
              alignment: Alignment.center,
              child: Text(
                "Box Green",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: Text(
                "Text Box",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RubikGemstones',
                ),
              ),
            ),
          ),
          Container(width: 200, height: 100, color: Colors.blue),
          Container(width: 200, height: 100, color: Colors.redAccent),
          Container(width: 200, height: 100, color: Colors.deepOrangeAccent),
          Container(width: 200, height: 100, color: Colors.amber),
          Container(width: 200, height: 100, color: Colors.white60),
        ],
      ),
    );
  }
}
