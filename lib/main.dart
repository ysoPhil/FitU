import 'package:TestProject/route_generator.dart';
import 'package:TestProject/image_banner.dart';
import 'package:TestProject/text_section.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitU',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // Initially display FirstPage
      home: HomePage(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

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

class SecondPage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  SecondPage({
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

class NutritionPage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  NutritionPage({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition', //change color to amber
            style: TextStyle(color: Colors.amber[800])),
      ),
      backgroundColor: Colors.amber[100],
      body: Center(
        child: Column(
          children: <Widget>[
            TextSection("Here the Nutrition plan will be displayed", data,
                Colors.amber[800]),
          ],
        ),
      ),
    );
  }
}

/*
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text(widget.title, textAlign: TextAlign.center)),
          backgroundColor: Colors.amber,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner("assets/images/gymstockphoto.jpg"),
              TextSection(
                  "Exercises", "An important factor in fitness is exercising."),
              TextSection("Nutrition",
                  "How you eat, and how much you eat is another factor"),
              TextSection(
                  "Dedication",
                  "Creating a fitness plan and sticking too it will determine" +
                      " your success."),
            ]));
  }
}*/
