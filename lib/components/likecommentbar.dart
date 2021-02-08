import 'package:flutter/material.dart';
import 'package:told_app/components/userselect.dart';
import 'package:told_app/data.dart';
import 'package:told_app/screens/articlepostscreen.dart';
import 'package:told_app/screens/photopostscreen.dart';
import 'package:told_app/screens/videopostscreen.dart';

import '../class.dart';

class LikeCommentBar extends StatefulWidget {
  final post;
  final bool commentButton;

  const LikeCommentBar({Key key, this.post, this.commentButton})
      : super(key: key);

  @override
  _LikeCommentBarState createState() => _LikeCommentBarState();
}

class _LikeCommentBarState extends State<LikeCommentBar> {
  void _commentbutton(post) async {
    if (post is PhotoPost) {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PhotoPostScreen(item: widget.post)));
      setState(() {});
    } else if (post is VideoPost) {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoPostScreen(item: widget.post)));
      setState(() {});
    } else if (post is ArticlePost) {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePostScreen(item: widget.post)));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 15,
        ),
        IconButton(
          icon: widget.post.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          color: widget.post.isLiked ? Colors.red : Colors.black,
          iconSize: 30.0,
          onPressed: () {
            setState(() {
              widget.post.isLiked = !widget.post.isLiked;
            });
          },
        ),
        Text(
          widget.post.likes.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          width: 30,
        ),
        widget.commentButton
            ? IconButton(
                icon: Icon(Icons.chat),
                iconSize: 30.0,
                onPressed: () => _commentbutton(widget.post))
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.chat,
                  size: 30.0,
                ),
              ),
        Text(
          widget.post.commentList.length.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Expanded(
          child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 30.0,
                  onPressed: () => showModalBottomSheet(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )),
                      context: context,
                      builder: (context) {
                        return SelectUser(
                          users: users,
                          post: widget.post,
                        );
                      }))),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
