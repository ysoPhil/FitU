import 'package:fitness_app/models/video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  static const routeName = '/video';
  final Video video;
  VideoScreen(this.video);
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.video.url),
        flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            disableDragSeek: false,
            loop: false,
            isLive: false,
            forceHD: false));
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        liveUIColor: Colors.amber,
      ),
      builder: (context, player) {
        return Scaffold(
            backgroundColor: Colors.amber[100],
            appBar: AppBar(
              backgroundColor: Colors.amber[800],
              title: Text(
                ("Demonstration of " +
                    widget.video.name), //TODO: Name the exercise
              ),
            ),
            body: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      widget.video.title,
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    player,
                    SizedBox(
                      height: 5,
                    ),
                    Text('Created by: ' + widget.video.author),
                    SizedBox(
                      height: 5,
                    ),
                    Text("This exercise is primarily meant to work out your " +
                        widget.video.target +
                        " area." +
                        "\n We highly suggest that you do not overexert by over training your " +
                        widget.video.target +
                        ". You should make sure that your body is ready by doing warm-up exercises, and that" +
                        " you stretch the" +
                        widget.video.target +
                        " region after your workout and cool down."),
                  ],
                )));
      },
    );
  }
}
