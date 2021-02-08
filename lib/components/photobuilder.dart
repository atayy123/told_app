import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/likecommentbar.dart';
import 'package:told_app/components/postheader.dart';

import 'package:told_app/screens/photopostscreen.dart';

class PhotoBuilder extends StatefulWidget {
  final PhotoPost item;

  const PhotoBuilder({Key key, this.item}) : super(key: key);
  @override
  _PhotoBuilderState createState() => _PhotoBuilderState();
}

class _PhotoBuilderState extends State<PhotoBuilder> {
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
                builder: (context) => PhotoPostScreen(item: widget.item)));
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: double.infinity,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 400.0),
                  child: Image.asset(
                    widget.item.photoUrl,
                    fit: BoxFit.fitWidth,
                  ),
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
              )
            ],
          )),
    );
  }
}
