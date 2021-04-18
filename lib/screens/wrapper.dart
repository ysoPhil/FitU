import 'dart:convert';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/models/nutrition_calculator.dart';
import 'package:fitness_app/models/survey.dart';
import 'package:fitness_app/screens/homepage_screen.dart';
import 'package:fitness_app/screens/loading_screen.dart';
import 'package:fitness_app/screens/nutrition_screen.dart';
import 'package:fitness_app/screens/questionnaire_screen.dart';
import 'package:fitness_app/screens/scheduler_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO: use Stateful widget with future builder and make
//      the questionnaire/caloriecounter/scheduler
//      stateless widgets that use surveyData
//
class Wrapper extends StatelessWidget {
  final String nextPage;
  final Survey survey;
  Wrapper(this.nextPage, this.survey);
  @override
  Widget build(BuildContext context) {
    if (survey.checkFlag == true) {
      if (nextPage == "Scheduler") {
        return SchedulerScreen(survey);
      }
      if (nextPage == "Nutrition") {
        NutritionCalculator calculator = NutritionCalculator(survey);
        calculator.initCalculator();
        return NutritionScreen(calculator);
      }
    }
    if (survey.checkFlag == false) {
      print("IN WRAPPER:" +
          survey.checkFlag.toString() +
          "\nInWrapper: UID: " +
          survey.getUID().toString());

      return QuestionnaireScreen(survey);
    }
  }
}
