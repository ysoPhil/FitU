import 'package:fitness_app/models/nutrition_calculator.dart';
import 'package:fitness_app/models/survey.dart';
import 'package:fitness_app/screens/loading_screen.dart';
import 'package:fitness_app/screens/questionnaire_screen.dart';
import 'package:fitness_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class NutritionScreen extends StatefulWidget {
  final Survey survey;
  NutritionScreen(this.survey);

  @override
  _NutritionScreenState createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  @override
  Widget build(BuildContext context) {
    NutritionCalculator calculator = new NutritionCalculator(widget.survey);
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: new AppBar(
        title: Text(
          "FitU Calorie Counter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber[900],
      ),
      drawer: AppDrawer(widget.survey),
      body: FutureBuilder(
          future: calculator.initCalculator(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            return (snapshot.hasData && widget.survey.checkFlag)
                ? Center(
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Target Calories for the Day: ${calculator.calorieTarget}',
                          style: TextStyle(fontSize: 18)),
                      //TODO: Add Validator
                      /*
                          Text('Calories Consumed For Breakfast:',
                              style: TextStyle(fontSize: 10)),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            //TODO: controller: num2controller,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.fastfood_sharp),
                              hintText:
                                  'Enter calories after breakfast or 0 if no breakfast yet',
                            ),
                          ),
                          Text('Enter your breakfast meal',
                              style: TextStyle(fontSize: 10)),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.fact_check_outlined),
                              hintText:
                                  'Enter the items you have ingested during breakfast',
                            ),
                          ),
                          Text('Calories Consumed For Lunch:',
                              style: TextStyle(fontSize: 10)),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            //TODO: controller: num3controller,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.fastfood_sharp),
                              hintText:
                                  'Enter calories after lunch or 0 if no lunch yet',
                            ),
                          ),
                          Text('Enter your lunch',
                              style: TextStyle(fontSize: 10)),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.fact_check_outlined),
                              hintText:
                                  'Enter the items you have ingested during lunch',
                            ),
                          ),
                          Text('Calories Consumed For Dinner:',
                              style: TextStyle(fontSize: 10)),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            //TODO: controller: num4controller,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.fastfood_sharp),
                              hintText:
                                  'Enter calories after dinner or 0 if no dinner yet',
                            ),
                          ),
                          Text('Enter your dinner',
                              style: TextStyle(fontSize: 10)),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.fact_check_outlined),
                              hintText:
                                  'Enter the items you have ingested during dinner',
                            ),
                          ),
                          Text(
                            //TODO: '$_subtractCalories calories remaining',

                            style: Theme.of(context).textTheme.headline4,
                          ),
                        */
                    ]),
                  )
                : LoadingScreen();
          }),
    );
  }
}
