import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/likecommentbar.dart';
import 'package:told_app/components/postheader.dart';
import 'package:told_app/screens/articlepostscreen.dart';

class ArticleBuilder extends StatefulWidget {
  final ArticlePost item;

  const ArticleBuilder({Key key, this.item}) : super(key: key);
  @override
  _ArticleBuilderState createState() => _ArticleBuilderState();
}

class _ArticleBuilderState extends State<ArticleBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          widget.item.isLiked = !widget.item.isLiked;
        });
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
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Text(
                    widget.item.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Text(
                    widget.item.explanation,
                    style: TextStyle(fontSize: 16),
                  )),
              SizedBox(
                height: 10,
              ),
              RawMaterialButton(
                fillColor: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "READ MORE",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ArticlePostScreen(item: widget.item)));
                  setState(() {});
                },
                shape: StadiumBorder(),
              ),
              SizedBox(
                height: 5,
              ),
              LikeCommentBar(post: widget.item, commentButton: true)
            ],
          )),
    );
  }
}
