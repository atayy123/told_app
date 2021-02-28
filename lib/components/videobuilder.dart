import 'dart:io';
import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/postheader.dart';
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
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
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

class _VideoBuilderState extends State<VideoBuilder>
    with TickerProviderStateMixin {
  AnimationController _aController;
  Animation _animation;

  @override
  void initState() {
    _aController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1).animate(_aController);

    _aController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _aController.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _aController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            PostHeader(
              user: widget.item.user,
              location: widget.item.location,
              time: widget.item.time,
            ),
            GestureDetector(
              onDoubleTap: () {
                setState(() {
                  widget.item.isLiked = true;
                });
                _aController.forward();
              },
              child: Stack(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 400),
                    child: VideoPlayerScreen(
                      video: widget.item.videoUrl,
                      typeof: "asset",
                    ),
                  ),
                  Positioned.fill(
                    child: FadeTransition(
                      opacity: _animation,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 72,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Text(
                  widget.item.descrip,
                  style: TextStyle(fontSize: 16),
                )),
            LikeCommentBar(
              post: widget.item,
            )
          ],
        ));
  }
}
