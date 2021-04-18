import 'dart:convert';

import 'package:fitness_app/models/survey.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NutritionCalculator {
  final Survey survey;
  double calorieIntake;
  double currentCalorie = 0;
  String currentDate;
  String savedDate;
  double bmr;

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

  _calculateBMR() {
    if (this.survey.gender == "Male" || this.survey.gender == "Other") {
      this.bmr = 66.0 +
          (6.23 * this.survey.currentWeight) +
          (12.7 * this.survey.height) -
          (6.8 * this.survey.age);
    } else {
      this.bmr = 665.0 +
          (4.35 * this.survey.currentWeight) +
          (4.7 * this.survey.height) -
          (4.7 * this.survey.age);
    }
    //Rounding is done when calling toStringAsFixed(2)
  }

  calculateDailyCalorieIntake() {
    _calculateBMR();
    if (this.survey.activity == 1) {
      calorieIntake = this.bmr * 1.2;
    } else if (this.survey.activity == 2) {
      this.calorieIntake = this.bmr * 1.375;
    } else if (this.survey.activity == 3) {
      this.calorieIntake = this.bmr * 1.55;
    } else if (this.survey.activity == 4) {
      this.calorieIntake = this.bmr * 1.725;
    } else if (this.survey.activity == 5) {
      this.calorieIntake = this.bmr * 1.9;
    }
  }

  Future<bool> initCalculator() async {
    print("IN Calculator");
    DateTime now = DateTime.now();
    currentDate = DateTime(now.year, now.month, now.day).toString();

    calculateDailyCalorieIntake();
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('counterData')) {
      print("IN Calculator: NO dailyData\nGenerating");
      savedDate = currentDate;
      currentCalorie = 0;
      storeDailyData();
      return true;
    }

    final extractedDailyData =
        json.decode(prefs.getString('counterData')) as Map<String, Object>;
    savedDate = extractedDailyData['savedDate'];

    if (currentDate == savedDate)
      currentCalorie = extractedDailyData['currentCalorie'];
    return false;
  }
}
