import 'dart:convert';

import 'package:fitness_app/models/survey.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NutritionCalculator {
  final Survey survey;
  double calorieTarget;
  double currentCalorie;
  String currentDate;
  String savedDate;

  NutritionCalculator(this.survey);

  storeDailyData() async {
    final prefs = await SharedPreferences.getInstance();
    final counterData = json.encode({
      'savedDate': this.currentDate,
      'currentCalorie': this.currentCalorie,
    });
    prefs.setString('counterData', counterData);
    print("In Scheduler: Stored Data");
  }

  Future<bool> initCalculator() async {
    calorieTarget = this.survey.calorieIntake;
    print("IN Calculator");
    DateTime now = DateTime.now();
    currentDate = DateTime(now.year, now.month, now.day).toString();
    calorieTarget = survey.calorieIntake;
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('counterData')) {
      print("IN Calculator: NO dailyData\nGenerating");
      savedDate = currentDate;
      storeDailyData();
      return true;
    }
    final extractedDailyData =
        json.decode(prefs.getString('counterData')) as Map<String, Object>;
    savedDate = extractedDailyData['savedDate'];
    currentCalorie = extractedDailyData['currentCalorie'];
    return false;
  }
}
