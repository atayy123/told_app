import 'package:flutter/material.dart';
import 'package:told_app/components/commentbuilder.dart';
import 'package:told_app/components/likecommentbar.dart';
import 'package:told_app/components/postheader.dart';
import '../class.dart';
import '../data.dart';

class ArticlePostScreen extends StatelessWidget {
  final ArticlePost item;
  ArticlePostScreen({this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Post"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              PostHeader(
                user: item.user,
                time: item.time,
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Text(
                    item.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Text(
                    item.explanation,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Text(
                    item.article,
                    style: TextStyle(fontSize: 16),
                  )),
              SizedBox(
                height: 5,
              ),
              LikeCommentBar(
                post: item,
                commentButton: false,
                commenttext: false,
              ),
              CommentBuilder(
                comments: comments,
              ),
            ],
          ),
        ));
  }
}
