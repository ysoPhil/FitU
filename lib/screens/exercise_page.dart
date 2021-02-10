///Authors: Phil D.
///Purpose: the screen for the exercises to bed displayed
import 'package:flutter/material.dart';
import '../utils/text_section.dart';

class ExercisePage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  ExercisePage({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises', //change color to amber
            style: TextStyle(color: Colors.amber[800])),
      ),
      backgroundColor: Colors.amber[100],
      body: Center(
        child: Column(
          children: <Widget>[
            TextSection("Here the exercises will be displayed", data,
                Colors.amber[800]),
          ],
        ),
      ),
    );
  }
}
