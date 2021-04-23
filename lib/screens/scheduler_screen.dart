import 'package:fitness_app/models/scheduler.dart';
import 'package:fitness_app/models/survey.dart';
import 'package:fitness_app/models/video.dart';
import 'package:fitness_app/screens/loading_screen.dart';
import 'package:fitness_app/screens/scheduler_list.dart';
import 'package:fitness_app/screens/video_screen.dart';
import 'package:fitness_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchedulerScreen extends StatefulWidget {
  final Survey survey;
  SchedulerScreen(this.survey);
  @override
  _SchedulerScreenState createState() => _SchedulerScreenState();
}

class _SchedulerScreenState extends State<SchedulerScreen> {
  @override
  Widget build(BuildContext context) {
    Scheduler schedule = Scheduler(widget.survey);
    schedule.setReps();
    return Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: new AppBar(
          title: Text(
            "Scheduled Workouts",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.amber[900],
        ),
        drawer: AppDrawer(widget.survey),
        body: Container(
            child: FutureBuilder(
          future: schedule.initScheduler(),
          builder: (context, AsyncSnapshot<List<Video>> snapshot) {
            return snapshot.hasData ? SchedulerList(schedule) : LoadingScreen();
          },
        )));
  }
}
