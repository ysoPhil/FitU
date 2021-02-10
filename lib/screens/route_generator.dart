///Written: Phil D.
///Purpose: A class that handles the navigation of pages in the app.
///Algorithm: Recieves a string and uses a switch statement to route
///           the next screen page.
///
/// INFO: Flutter generates pages ontop of each other similar to a
///       stack, or a "Deck of cards". When a new page is routed
///       it is added to the top of the stack. The back arrow on
///       the app bar removes the top page from the stack onto
///       the previous

import 'package:flutter/material.dart';
import 'exercise_page.dart';
import 'home_page.dart';
import 'nutrition_page.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/exercises':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ExercisePage(
              data: args,
            ),
          );
        }
        break;
      case '/nutrition':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => NutritionPage(
              data: args,
            ),
          );
        }
        break;
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
