import 'dart:convert';
import 'dart:math';
import 'package:fitness_app/models/survey.dart';
import 'package:fitness_app/models/video.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scheduler {
  final Random _random = new Random();
  final Survey survey;
  String currentDate = '';
  String savedDate = '';
  String repSet = '';

  List<Video> exercises = [];

  String lastTarget;
  List<String> currentTargets = [];
  final List<String> targetHierarchy = [
    "chest",
    "arm",
    "abs",
    "shoulder",
    "back",
    "leg",
    "glute"
  ];

  Scheduler(this.survey);
  List<Video> _getVideoList(String target) {
    switch (target) {
      case 'abs':
        return abs;
      case 'arm':
        return arm;
      case 'back':
        return back;
      case 'chest':
        return chest;
      case 'glute':
        return glute;
      case 'leg':
        return leg;
      case 'shoulder':
        return shoulder;
    }
    return chest;
  }

  setReps() {
    switch (survey.activity) {
      case 1:
        {
          this.repSet = "Try doing 2 sets of 10 repitions.";
        }
        break;
      case 2:
        {
          this.repSet = "Try doing 2 sets of 12 repitions.";
        }
        break;
      case 3:
        {
          this.repSet = "Try doing 2 sets of 15 repitions.";
        }
        break;
      case 4:
        {
          this.repSet = "Try doing 3 sets of 10 repitions.";
        }
        break;
      case 5:
        {
          this.repSet = "Try doing 3 sets of 15 repitions.";
        }
        break;
      default:
        {
          this.repSet = "Try doing 2 sets of 10 repitions.";
        }
    }
  }

  _generateSchedule() {
    int i = 0;
    int nextTargetIndex;

    if (lastTarget == null) {
      nextTargetIndex = 0;
    }
    if (nextTargetIndex != 0)
      targetHierarchy.forEach((target) {
        i++;

        if (target == lastTarget) {
          nextTargetIndex = i;
        }
      });
    for (int j = 0; j < 3; j++) {
      if (nextTargetIndex >= targetHierarchy.length) {
        nextTargetIndex = 0;
      }
      if (nextTargetIndex < targetHierarchy.length) {
        currentTargets.add(targetHierarchy[nextTargetIndex]);
        nextTargetIndex++;
      }
    }

    currentTargets.forEach((target) {
      List<Video> playlist = _getVideoList(target);
      lastTarget = target;
      int i = 0;
      while (i < 2) {
        Video temp = playlist[_random.nextInt(playlist.length)];
        if (temp.activityLevel <= survey.activity &&
            !exercises.contains(temp)) {
          exercises.add(temp);
          i++;
        }
      }
    });
  }

  storeDailyData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> temp = [];
    for (int i = 0; i < exercises.length; i++) {
      temp.add((exercises[i].target + "-" + exercises[i].id));
    }

    final dailyData = json.encode({
      'savedDate': this.currentDate,
      'lastTarget': this.lastTarget,
      'exercises': temp
    });
    prefs.setString('dailyData', dailyData);
    print("In Scheduler: Stored Data");
  }

  Future<List<Video>> initScheduler() async {
    setReps();
    print("IN Scheduler");

    DateTime now = DateTime.now();
    currentDate = DateTime(now.year, now.month, now.day).toString();
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('dailyData')) {
      print("IN Scheduler: NO dailyData\nGenerating");
      _generateSchedule();
      savedDate = currentDate;
      print("IN SCHEDULER: TITLE: " + exercises[0].title);
      storeDailyData();
      return exercises;
    }

    final extractedDailyData =
        json.decode(prefs.getString('dailyData')) as Map<String, Object>;
    this.savedDate = extractedDailyData['savedDate'];
    this.lastTarget = extractedDailyData['lastTarget'];
    if (currentDate != savedDate) {
      this._generateSchedule();
      this.storeDailyData();
      return exercises;
    }

    if (currentDate == savedDate) {
      List<dynamic> exercisePlaceHold;
      exercisePlaceHold = extractedDailyData['exercises'];
      exercisePlaceHold.forEach((holder) {
        List<String> temp = holder.split('-');
        List<Video> playlist = this._getVideoList(temp[0]);
        if (playlist == null) return;
        for (int i = 0; i < playlist.length; i++) {
          if (playlist[i].id == temp[1]) {
            this.exercises.add(playlist[i]);
            //print("Adding to exercise list");
          }
        }
      });
    }
    return exercises;
  }
}
