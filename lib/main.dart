import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/route_generator.dart';

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
