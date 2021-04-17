import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';

class Survey {
  String _uid;
  String gender;
  double height;
  double currentWeight;
  int age;
  int activity;
  double bmr;
  double calorieIntake;
  bool checkFlag = false;
  bool dailyFlag;

  String get uid {
    return uid;
  }

  set uid(val) {
    this._uid = val;
  }

  calculateBMR() {
    if (this.gender == "Male" || this.gender == "Other") {
      this.bmr = 66.0 +
          (6.23 * this.currentWeight) +
          (12.7 * this.height) -
          (6.8 * this.age);
    } else {
      this.bmr = 665.0 +
          (4.35 * this.currentWeight) +
          (4.7 * this.height) -
          (4.7 * this.age);
    }
    //Rounding is done when calling toStringAsFixed(2)
  }

  calculateDailyCalorieIntake() {
    if (this.activity == 1) {
      this.calorieIntake = this.bmr * 1.2;
    } else if (this.activity == 2) {
      this.calorieIntake = this.bmr * 1.375;
    } else if (this.activity == 3) {
      this.calorieIntake = this.bmr * 1.55;
    } else if (this.activity == 4) {
      this.calorieIntake = this.bmr * 1.725;
    } else if (this.activity == 5) {
      this.calorieIntake = this.bmr * 1.9;
    }
  }

  Future<bool> storeData() async {
    print("IN STORE DATA");
    final prefs = await SharedPreferences.getInstance();
    final surveyData = json.encode({
      'uid': this._uid,
      'currentWright': this.currentWeight,
      'height': this.height,
      'age': this.age,
      'bmr': this.bmr,
      'calorieIntake': this.calorieIntake,
      'gender': this.gender,
      'activity': this.activity
    });
    prefs.setString('surveyData', surveyData);
    print("In Survey: Stored Data; Flag is true");
    this.checkFlag = true;
    return true;
  }

  String getUID() {
    return _uid;
  }

  Future<bool> initSurvey() async {
    print("IN SURVEY");

    if (checkFlag) {
      print("IN SURVEY: True Flag");
      return true;
    }

    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    String _userId = extractedUserData['userId'];
    print("USERID" + _userId);

    if (!prefs.containsKey('surveyData')) {
      print("IN SURVEY: False NO surveyData");
      this.checkFlag = false;

      return false;
    }

    final extractedSurveyData =
        json.decode(prefs.getString('surveyData')) as Map<String, Object>;

    if (_uid == _userId) {
      this.activity = extractedSurveyData['activity'];
      this.age = extractedSurveyData['age'];
      this.currentWeight = extractedSurveyData['currentWeight'];
      this.gender = extractedSurveyData['gender'];
      this.height = extractedSurveyData['height'];
      this.bmr = calculateBMR();
      calculateDailyCalorieIntake();
      this.checkFlag = true;
      print("In Survey: True flag pulled data");
      //Might have issues
      return true;
    }
    this.checkFlag = false;
    return false;
  }
}
