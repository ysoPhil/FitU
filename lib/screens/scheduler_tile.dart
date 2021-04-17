import 'package:fitness_app/models/video.dart';
import 'package:fitness_app/screens/video_screen.dart';
import 'package:flutter/material.dart';

class SchedulerTile extends StatelessWidget {
  final Video video;
  SchedulerTile(this.video);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Image.network(video.imageUrl),
          title: Text(video.name),
          subtitle: Text('primarily targets ' + video.target),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VideoScreen(video)));
          },
        ),
      ),
    );
  }
}
