import 'package:flutter/material.dart';
import 'style.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(headline6: AppBarTextStyle),
          ),
          textTheme: TextTheme(
            headline6: TitleTextStyle,
            bodyText2: BodyText2Style,
          )),
    );
  }
}
