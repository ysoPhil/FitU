import 'package:fitness_app/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference surveyCollection =
      Firestore.instance.collection('surveyCollection');

  Future updateSurveyData(int currentWeight, String gender, int height, int age,
      int activity) async {
    return await surveyCollection.document(uid).setData({
      'gender': gender,
      'currentWeight': currentWeight,
      'height': height,
      'age': age,
      'activity': activity
    });
  }
//  Future<Survey> getSurvey(QuerySnapshot snapshot) async {
//    return await surveyCollection.snapshots().where((event) => false)
//  }
}
