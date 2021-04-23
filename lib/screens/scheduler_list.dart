import 'package:fitness_app/models/scheduler.dart';
import 'package:fitness_app/models/survey.dart';
import 'package:fitness_app/models/video.dart';
import 'package:fitness_app/screens/scheduler_tile.dart';
import 'package:fitness_app/screens/video_screen.dart';
import 'package:flutter/material.dart';

class SchedulerList extends StatefulWidget {
  final Scheduler schedule;
  SchedulerList(this.schedule);
  @override
  _SchedulerListState createState() => _SchedulerListState();
}

class _SchedulerListState extends State<SchedulerList> {
  String repsets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.schedule.exercises.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                leading:
                    Image.network(widget.schedule.exercises[index].imageUrl),
                title: Text(widget.schedule.exercises[index].name),
                subtitle: Text('primarily targets ' +
                    widget.schedule.exercises[index].target +
                    "\n" +
                    widget.schedule.repSet),
                isThreeLine: true,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VideoScreen(widget.schedule.exercises[index])));
                },
              ),
            ),
          );
        });
  }
}
