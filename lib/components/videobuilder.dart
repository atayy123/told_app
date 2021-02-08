import 'dart:io';
import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/postheader.dart';
import 'package:told_app/screens/videopostscreen.dart';
import 'package:video_player/video_player.dart';

import 'likecommentbar.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String video;
  final String typeof;
  VideoPlayerScreen({Key key, this.video, this.typeof}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create an store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    if (widget.typeof == "asset") {
      _controller = VideoPlayerController.asset(widget.video);
    } else {
      _controller = VideoPlayerController.file(File(widget.video));
    }

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class VideoBuilder extends StatefulWidget {
  final VideoPost item;

  const VideoBuilder({Key key, this.item}) : super(key: key);
  @override
  _VideoBuilderState createState() => _VideoBuilderState();
}

class _VideoBuilderState extends State<VideoBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          widget.item.isLiked = !widget.item.isLiked;
        });
      },
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPostScreen(item: widget.item)));
        setState(() {});
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: <Widget>[
              PostHeader(
                username: widget.item.user,
                location: widget.item.location,
                time: widget.item.time,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 900),
                child: VideoPlayerScreen(
                  video: widget.item.videoUrl,
                  typeof: "asset",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Text(
                    widget.item.descrip,
                    style: TextStyle(fontSize: 16),
                  )),
              LikeCommentBar(
                post: widget.item,
                commentButton: true,
              ),
            ],
          )),
    );
  }
}
