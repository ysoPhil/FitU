import 'package:fitness_app/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import '../models/video.dart';
import '../widgets/video_item.dart';
//import '../widgets/chewie_listitem.dart';

class CategoryExerciseScreen extends StatefulWidget {
  static const routeName = '/exerciseCategory';

  @override
  _CategoryExerciseScreenState createState() => _CategoryExerciseScreenState();
}

class _CategoryExerciseScreenState extends State<CategoryExerciseScreen> {
  var _isInitloaded = false;
  String categoryTitle;
  List<Video> listofvideos = [];

  @override
  void didChangeDependencies() {
    if (_isInitloaded == false) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      _isInitloaded = true;
    }
    super.didChangeDependencies();
  }

  List<Video> getVideos() {
    switch (categoryTitle) {
      case 'Abs':
        return abs;
      case 'Arm':
        return arm;
      case 'Back':
        return back;
      case 'Chest':
        return chest;
      case 'Glute':
        return glute;
      case 'Leg':
        return leg;
      case 'Shoulder':
        return shoulder;
      case 'Yoga':
        return yoga;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    // categoryTitle = routeArgs['title']; //??
    listofvideos = getVideos();
    print(listofvideos);
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle exercises'),
        backgroundColor: Colors.amber[900],
      ),
      backgroundColor: Colors.amber[100],
      body: ListView(
        children: listofvideos.map((video) {
          return Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 4),
                  blurRadius: 6.0,
                  spreadRadius: 1,
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: InkWell(
                child: ListTile(
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 50,
                      minHeight: 100,
                    ),
                    child: Image.network(video.imageUrl),
                  ),
                  title: Text(
                    video.title,
                    softWrap: true,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoScreen(video)));
                  },
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
