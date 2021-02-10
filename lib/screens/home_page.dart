///Authors: Phil D.
///Purpose: The homepage of the application
import '../utils/text_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/image_banner.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FitU', style: TextStyle(color: Colors.amber[800])),
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageBanner("assets/images/gymstockphoto.jpg"),
            Text(
              'Welcome back',
              style: TextStyle(fontSize: 50, color: Colors.amber[800]),
            ),
            RaisedButton(
              padding: EdgeInsets.only(top: 5),
              child: TextSection(
                  "Exercises",
                  "An important factor in fitness is exercising.",
                  Colors.amber[800]),
              onPressed: () {
                // Pushing a named route
                Navigator.of(context).pushNamed(
                  '/exercises',
                  arguments: 'Hello there from the first page!',
                );
              },
            ),
            RaisedButton(
              padding: EdgeInsets.only(top: 5),
              child: TextSection(
                  "Nutrition",
                  "Eat healthier foods with less caloric intake.",
                  Colors.amber[800]),
              onPressed: () {
                // Pushing a named route
                Navigator.of(context).pushNamed(
                  '/nutrition',
                  arguments: 'Hello there from the first page!',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
