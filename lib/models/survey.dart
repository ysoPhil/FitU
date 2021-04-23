import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';

class Survey {
  String _uid = '';
  String gender = '';
  double height = 0;
  double currentWeight = 0;
  int age = 0;
  int activity = 1;
  //double bmr;
  //double calorieIntake;
  bool checkFlag = false;

  String get uid {
    return uid;
  }

  set uid(val) {
    this._uid = val;
  }

  Future<bool> storeData() async {
    print("IN STORE DATA");
    final prefs = await SharedPreferences.getInstance();
    final surveyData = json.encode({
      'uid': this._uid,
      'currentWright': this.currentWeight,
      'height': this.height,
      'age': this.age,
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
      this.checkFlag = true;
      print("In Survey: True flag pulled data");
      //Might have issues
      return true;
    }
    this.checkFlag = false;
    return false;
  }
}
