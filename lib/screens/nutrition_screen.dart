import 'package:fitness_app/models/nutrition_calculator.dart';
import 'package:fitness_app/models/survey.dart';
import 'package:fitness_app/screens/loading_screen.dart';
import 'package:fitness_app/screens/questionnaire_screen.dart';
import 'package:fitness_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class NutritionScreen extends StatefulWidget {
  final NutritionCalculator calculator;
  NutritionScreen(this.calculator);

  @override
  _NutritionScreenState createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController num1controller = new TextEditingController();
  TextEditingController breakfastController = new TextEditingController();
  TextEditingController lunchController = new TextEditingController();
  TextEditingController dinnerController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    widget.calculator.initCalculator();
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.

          title: Text(
            'Fitu',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.amber[900],
        ),
        drawer: AppDrawer(widget.calculator.survey),
        backgroundColor: Colors.amber[100],
        body: Form(
          key: _formKey,
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Target Calories for today: ${widget.calculator.calorieIntake.round()}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: breakfastController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.breakfast_dining),
                    hintText: 'Calories consumed for breakfast, 0 if none.',
                  ),
                ),
                Text('Calories Consumed For Lunch:',
                    style: TextStyle(fontSize: 10)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: lunchController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.fastfood_sharp),
                    hintText: 'Calories consumed for Lunch, 0 if none.',
                  ),
                ),
                Text('Enter your lunch', style: TextStyle(fontSize: 10)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: dinnerController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.fastfood_sharp),
                    hintText: 'Calories consumed for Dinner, 0 if none.',
                  ),
                ),
                Text(
                  ' calories remaining ' +
                      '${(widget.calculator.calorieIntake - widget.calculator.currentCalorie).round()}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    print("In button");
                    setState(() {
                      widget.calculator.currentCalorie =
                          widget.calculator.currentCalorie +
                              int.parse(breakfastController.text) +
                              int.parse(lunchController.text) +
                              int.parse(dinnerController.text);
                      widget.calculator.storeDailyData();
                    });
                  },
                  child: Text("Calculate"),
                ),
              ],
            ),
          ),
        ));
  }
}
