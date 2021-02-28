import 'package:flutter/material.dart';
import 'package:told_app/components/commentbuilder.dart';
import 'package:told_app/components/likecommentbar.dart';
import 'package:told_app/components/postheader.dart';
import '../class.dart';
import 'package:told_app/components/videobuilder.dart';
import '../data.dart';

class VideoPostScreen extends StatefulWidget {
  final VideoPost item;
  VideoPostScreen({this.item});
  @override
  _VideoPostScreenState createState() => _VideoPostScreenState();
}

class _VideoPostScreenState extends State<VideoPostScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Post"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
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
                      _controller.forward();
                    },
                    child: Stack(
                      children: [
                        VideoPlayerScreen(
                          video: widget.item.videoUrl,
                          typeof: "asset",
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
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Text(
                        widget.item.descrip,
                        style: TextStyle(fontSize: 16),
                      )),
                  LikeCommentBar(
                    post: widget.item,
                    commentButton: false,
                    commenttext: false,
                  ),
                  CommentBuilder(
                    comments: comments,
                  )
                ],
              )),
        ));
  }
}
