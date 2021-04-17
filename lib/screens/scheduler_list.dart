import 'package:fitness_app/models/scheduler.dart';
import 'package:fitness_app/models/survey.dart';
import 'package:fitness_app/models/video.dart';
import 'package:fitness_app/screens/scheduler_tile.dart';
import 'package:fitness_app/screens/video_screen.dart';
import 'package:flutter/material.dart';

class SchedulerList extends StatefulWidget {
  final List<Video> video;
  SchedulerList(this.video);
  @override
  _SchedulerListState createState() => _SchedulerListState();
}

class _SchedulerListState extends State<SchedulerList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.video.length,
        itemBuilder: (context, index) {
          return SchedulerTile(widget.video[index]);
        });
  }
}
