import 'package:flutter/material.dart';
import 'package:told_app/components/sendpost.dart';
import 'package:told_app/data.dart';
import 'package:told_app/screens/commentscreen.dart';
import 'package:told_app/screens/userlist.dart';

class LikeCommentBar extends StatefulWidget {
  final post;
  final bool commentButton;
  final bool commenttext;

  const LikeCommentBar(
      {Key key, this.post, this.commentButton = true, this.commenttext = true})
      : super(key: key);

  @override
  _LikeCommentBarState createState() => _LikeCommentBarState();
}

class _LikeCommentBarState extends State<LikeCommentBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
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
              widget.commentButton
                  ? IconButton(
                      icon: Icon(Icons.chat),
                      iconSize: 30.0,
                      onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CommentScreen(
                              comments: widget.post.commentList,
                            );
                          })))
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.chat,
                        size: 30.0,
                      ),
                    ),
              IconButton(
                  icon: Icon(Icons.sync),
                  iconSize: 30.0,
                  onPressed: () async {
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text('Do you wish to Retold this post?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }),
              IconButton(
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
                      })),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserListPage(
                                title: "Likes",
                                users: users,
                              )));
                },
                child: Text(
                  widget.post.likes.toString() + " likes" + " • ",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserListPage(
                                title: "Retolds",
                                users: users,
                              )));
                },
                child: Text(
                  widget.post.retolds.toString() + " retolds",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            if (widget.commenttext) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CommentScreen(
                  comments: widget.post.commentList,
                );
              }));
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              widget.post.commentList.length.toString() + " comments",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
