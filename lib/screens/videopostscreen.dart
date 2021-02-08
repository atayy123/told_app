import 'package:flutter/material.dart';
import 'package:told_app/components/commentbuilder.dart';
import 'package:told_app/components/likecommentbar.dart';
import 'package:told_app/components/postheader.dart';
import '../class.dart';
import 'package:told_app/components/videobuilder.dart';
import '../data.dart';

class VideoPostScreen extends StatelessWidget {
  final VideoPost item;
  VideoPostScreen({this.item});

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
                    username: item.user,
                    location: item.location,
                    time: item.time,
                  ),
                  VideoPlayerScreen(
                    video: item.videoUrl,
                    typeof: "asset",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Text(
                        item.descrip,
                        style: TextStyle(fontSize: 16),
                      )),
                  LikeCommentBar(
                    post: item,
                    commentButton: false,
                  ),
                  CommentBuilder(
                    comments: comments,
                  )
                ],
              )),
        ));
  }
}
